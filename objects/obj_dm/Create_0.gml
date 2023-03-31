/// @description Insert description here
// You can write your code in this editor

obj_player.visible = false;

phase = "SETUP";
game_view = "home";

global.bodypart_index = [
obj_bp001_tentacle,
obj_bp002_massive_eye,
obj_bp003_fleshy_mantle
]

global.card_index = [
obj_card,
obj_card_001_beast_cutting,
obj_card_002_tentacle_lashing,
obj_card_003_cephalo_smackdown,
obj_card_004_fire_and_fang,
obj_card_005_nothing_personnel,
obj_card_006_speaking_demon,
obj_card_007_squid_fu,
obj_card_008_pankration,
obj_card_009_bone_dancer
]

global.gadget_index = [
obj_red_lever,
obj_green_lever,
obj_blue_lever
]

player1_cards = obj_player.getDeck();
player1_discard = [];
player1_bodyparts = obj_player.getBody();
player1_gadgets = obj_player.getGadgets();

player2_cards = [9,9,9];
player2_discard = [];
player2_bodyparts = [0, 0, 1, 2, 0, 0];

player1 = instance_create_layer(0,0,"Pieces",obj_duelist);
player1.name = "LionBots";
player2 = instance_create_layer(0,0,"Pieces",obj_duelist);

player1.opponent = player2;
player2.opponent = player1;

// sub-managers instantiations
dialog = instance_create_layer(
	0,
	0,
	"Overlay",
	obj_duel_dialog_box
);

// game piece instantiations
for (var i = 0; i < 6; i+= 1) {
	var p1_bp = instance_create_layer(
	210,
	322+i*16, //magic number p1_y_offset
	"Slots",
	global.bodypart_index[player1_bodyparts[i]],
	{
		controller: player1
	}
	);
	array_push(player1.bodyparts, p1_bp);
}

for (var i = 0; i < 6; i+=1) { // magic number 6 is BP count
	var p2_bp = instance_create_layer(
	2, // space into slots
	66+i*16, //magic number p2_y_offset
	"Slots",
	global.bodypart_index[player2_bodyparts[i]],
	{
		controller: player2
	}
	);
	array_push(player2.bodyparts, p2_bp);
}

gadgets = [];

for (var i = 0; i<array_length(player1_gadgets);i++) { //not even programming, do real gadgets later
	next_gadget = instance_create_layer(16, 320+(32*i), "Pieces", global.gadget_index[player1_gadgets[i]], {owner: player1})
	array_push(gadgets, next_gadget);
}

instance_create_layer(112, 320, "Pieces", obj_go_btn);

goToDraw = function() {
	phase = "DRAW";
	
	if (array_length(player1_cards) == 0) {
		player1_cards = array_shuffle(player1_discard);
		player1_discard = [];
	}
	if (array_length(player2_cards) == 0) {
		player2_cards = array_shuffle(player2_discard);
		player2_discard = [];
	}
	p1_active_card_id = array_pop(player1_cards);
	p2_active_card_id = array_pop(player2_cards);

	player1.active_card = instance_create_layer(98, 338, "Slots", global.card_index[p1_active_card_id], {controller: player1});
	if (array_length(player1_cards) > 0) {
		player1.next_card = instance_create_layer(2, 418, "Slots", global.card_index[array_last(player1_cards)], {controller: player1});
	}
	player2.active_card = instance_create_layer(98, 82, "Slots", global.card_index[p2_active_card_id], {controller: player2});
	if (array_length(player2_cards) > 0) {
		player2.next_card = instance_create_layer(194, 2, "Slots", global.card_index[array_last(player2_cards)], {controller: player2});
	}
	player1.refreshDicePool();
	player2.refreshDicePool();
	// any other (blocking?) draw phase stuff?
	goToPlan();
}

goToPlan = function() {
	player1.energy = 1;
	player2.energy = 1;
	for(var i=0;i<array_length(gadgets);i++){
		gadgets[i].reset();
	}
	
	phase = "PLAN";
}

goToClash = function() {
	phase = "CLASH";
	game_view = "clash";
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	with (_cameraman) {
		event_user(1);
	}
	obj_mouse_cursor.y -= 160;
	
	player1.translateDicePool();
	player2.translateDicePool();
	for (i=0;i<array_length(player1.dice_pool);i++) {
		player1.dice_pool[i].live = false;
	}
	for (i=0;i<array_length(player2.dice_pool);i++) {
		player2.dice_pool[i].live = false;
	}
	player1.translateActiveCard();
	player2.translateActiveCard();
	
	player1.translateBodyParts();
	player2.translateBodyParts();
	
	player2.AIAssignDice();
	
}

goToBlows = function() {
	phase = "BLOWS";
	for (i=0;i<instance_number(obj_bodypart);i++) {
		var bp = instance_find(obj_bodypart, i);
		bp.evaluate();
	}
	goToResults();
}

goToResults = function() {
	phase = "RESULTS";
	alarm[0] = 30;
}

goToCleanup = function() {
	phase = "CLEANUP";
	if (player1.blood<=0 && player2.blood<=0) {
		goToTie();
	} else if (player1.blood <= 0) {
		goToLoss();	
	} else if (player2.blood <= 0) {
		goToWin();
	}
	
	game_view = "home";
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	
	with(_cameraman) {
		event_user(2);	
	}
	obj_mouse_cursor.y += 160;
	player1.resetBodyParts();
	player2.resetBodyParts();
	player1.active_card.cleanupEffect();
	player2.active_card.cleanupEffect();
	for (var i=0;i<array_length(player1.effects);i++){
		player1.effects[i].cleanupEffect();
	}
	for (var i=0;i<array_length(player2.effects);i++){
		player2.effects[i].cleanupEffect();
	}
	array_push(player1_discard, player1.active_card.index_number);
	array_push(player2_discard, player2.active_card.index_number);
	instance_destroy(player1.active_card);
	instance_destroy(player1.next_card);
	instance_destroy(player2.active_card);
	instance_destroy(player2.next_card);
	if (phase != "WIN") {
		goToDraw();
	}
}

goToLoss = function() {
	obj_debug_duck.visible = true;
	obj_debug_duck.debugMessage = "LOSE...";
}

goToTie = function() {
	obj_debug_duck.visible = true;
	obj_debug_duck.debugMessage = "TIE";
}

goToWin = function() {
	obj_debug_duck.visible = true;
	obj_debug_duck.debugMessage = "WIN!";
	phase = "WIN";
}

goToDraw();