/// @description Insert description here
// You can write your code in this editor

obj_player.visible = false;
obj_player.lock();

phase = "SETUP"; // for game state
game_view = "home"; //for camera state

player1 = instance_create_layer(0,0,"Pieces",obj_duelist);
player1.name = "LionBots";
player2 = instance_create_layer(0,0,"Pieces",obj_ai_duelist);
foes = ["CHESHIRE LION", "DRAGON", "MANTIS SENSEI", "BONE DEMON", "TREASURE WIGHT", "BONE GARGOYLE", "KRAKEN"];
player2.name = noone;

// enemy randomizer
while (player2.name == noone) {
	var candidate = foes[irandom(6)];
	var already_fought = false;
	for (var i=0;i<array_length(global.dreamforms_unlocked);i++) {
		if (candidate == global.dreamforms_unlocked[i]) {
			already_fought = true;
		}
	}
	if (!already_fought) {
		player2.name = candidate;	
	}
}

if (!global.endless_mode) {
	player2.name = global.duel_parameters.enemy_duelist;
}

player1_cards = obj_player.getDeck();
player1_discard = [];
player1_bodyparts_list = obj_player.getBody();
player1_gadgets = obj_player.getGadgets();

player2_cards = player2.getDeck(player2.name); // gets ai duelist logic for particular opponent
player2_discard = [];
player2_bodyparts_list = player2.getBody(player2.name);
player2_gadgets = player2.getGadgets(player2.name);

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
	global.bodypart_index[player1_bodyparts_list[i]],
	{
		controller: player1
	}
	);
	p1_bp.hp = obj_player.bodyparts_hp[i];
	p1_bp.spawnSlots();
	array_push(player1.bodyparts, p1_bp);
}

for (var i = 0; i < 6; i+=1) { // magic number 6 is BP count
	var p2_bp = instance_create_layer(
	2, // space into slots
	66+i*16, //magic number p2_y_offset
	"Slots",
	global.bodypart_index[player2_bodyparts_list[i]],
	{
		controller: player2
	}
	);
	p2_bp.spawnSlots();
	array_push(player2.bodyparts, p2_bp);
}

gadgets = [];

for (var i = 0; i<array_length(player1_gadgets);i++) {
	var gadget_data = player1_gadgets[i];
	next_gadget = instance_create_layer(
		gadget_data.xx,
		gadget_data.yy+yOffset(),
		"Pieces",
		global.gadget_index[gadget_data.gadget_index],
		{owner: player1}
	)
	array_push(gadgets, next_gadget);
}

for (var i = 0; i<array_length(player2_gadgets);i++) { //not even programming, do real gadgets later
	var gadget_data = player2_gadgets[i];
	next_gadget = instance_create_layer(
		gadget_data.xx,
		gadget_data.yy,
		"Pieces",
		global.gadget_index[gadget_data.gadget_index],
		{owner: player2}
	)
	array_push(gadgets, next_gadget);
}

instance_create_layer(112, 320, "Pieces", obj_go_btn);
// Func declarations
panToMiddle = function() {
	show_debug_message("panning to middle");
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	with (_cameraman) {
		event_user(1);
	}
	obj_mouse_cursor.y -= 160;
	
	player1.translateActiveCard();
	player2.translateActiveCard();
	
	player1.translateBodyParts();
	player2.translateBodyParts();
}

changeView = function() {
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	with (_cameraman) {
		event_user(0);
	}

	switch(game_view)
	{
		case "home":
			game_view = "away";
			obj_mouse_cursor.y -= 320
		break;
		case "away":
			game_view = "home";
			obj_mouse_cursor.y += 320
		break;
		default:
		break;
	}
}

// Main game loop: DRAW, PLAN, CLASH, RESULTS, CLEANUP, repeat

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
	for(var i=0;i<array_length(gadgets);i++){
		gadgets[i].reset();
		gadgets[i].endOfDrawPhaseEffect();
	}
	player1.energy = 1;
	player2.energy = 1;
	phase = "PLAN";
}

goToClash = function() {
	for(var i=0;i<array_length(gadgets);i++){
		gadgets[i].reset();
		gadgets[i].endOfPlanPhaseEffect();
	}
	phase = "CLASH";
	game_view = "clash";
	panToMiddle();
	
	player1.active_card.clashEffect();
	player2.active_card.clashEffect();
	
	if (!player1.hasEffect(obj_eff_stunned)) {
		player1.translateDicePool();
	}
	
	player2.translateDicePool();
	for (i=0;i<array_length(player1.dice_pool);i++) {
		player1.dice_pool[i].live = false;
	}
	for (i=0;i<array_length(player2.dice_pool);i++) {
		player2.dice_pool[i].live = false;
	}
	
	// This is just the AI playing its turn, not phase
	// transition logic
	if (!player2.hasEffect(obj_eff_stunned)) {
		player2.alarm[0] = 15;
		player2.AIAssignDice_DefendHeadAndBody();
	}
	
	// put in some logic to call "after dice pool is rolled" fx
	// the main example being "Frightened" status effect
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
	} else {
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
		
		array_push(player1_discard, player1.active_card.index_number);
		array_push(player2_discard, player2.active_card.index_number);
		instance_destroy(player1.active_card);
		instance_destroy(player1.next_card);
		instance_destroy(player2.active_card);
		instance_destroy(player2.next_card);
		for (var i=0;i<array_length(player1.effects);i++){
			player1.effects[i].cleanupEffect();
		}
		for (var i=0;i<array_length(player2.effects);i++){
			player2.effects[i].cleanupEffect();
		}
		player1.resetDiceModifiers();
		player2.resetDiceModifiers();
		
		goToDraw();
	}
}

cleanupDuel = function() {
	obj_player.visible = true;
	obj_player.unlock();
	global.duel_parameters.victoryHandler();
	room_goto(global.duel_parameters.fight_room);
}

goToLoss = function() {
	cleanupDuel();
	obj_player.win_count = 0;
	obj_player.dreamform = "BASIC PERSON";
	global.dreamforms_unlocked = ["BASIC PERSON"];
	phase = "LOSS";
	obj_player.should_wake = true;
}

goToTie = function() {
	cleanupDuel();
	phase = "TIE";
	for(var i=0; i<array_length(player1.bodyparts); i++) {
		obj_player.bodyparts_hp[i] = player1.bodyparts[i].hp;
	}
	obj_player.should_wake = true;
}

goToWin = function() {
	obj_player.win_count++;
	obj_player.registerWin(player2.name);
	if (obj_player.win_count >= array_length(foes)) {
		obj_player.win_count = "WIN!";	
	}
	for(var i=0; i<array_length(player1.bodyparts); i++) {
		obj_player.bodyparts_hp[i] = player1.bodyparts[i].hp;
		show_debug_message("Set a bp to this much hp: "+string(player1.bodyparts[i].hp));
	}
	
	goToClaimBP();
}


goToClaimBP = function() {
	phase = "CLAIM_BP"; // this enables the BP interaction and fx
	// display WIN block letter overlay
	// cursor click goes to post-duel cleanup
}

replaceBP = function(duelist, bp_index, new_bp_index_number) {
	
	// bp itself and associted slots
	show_debug_message("Duelist: ")
	show_debug_message(duelist)
	var old_bp = duelist.bodyparts[bp_index];
	var new_bp = instance_create_layer(
		old_bp.x, // space into slots
		old_bp.y, //magic number p2_y_offset
		"Slots",
		global.bodypart_index[new_bp_index_number],
		{
			controller: duelist
		}
	);
	new_bp.spawnSlots();
	show_debug_message($"Array of bps before replacement: {string(duelist.bodyparts)}")
	array_delete(duelist.bodyparts, bp_index, 1);
	array_insert(duelist.bodyparts, bp_index, new_bp);
	show_debug_message($"Added: {new_bp}");
	show_debug_message($"removed: {old_bp}");
	show_debug_message($"Array of bps after replacement: {string(duelist.bodyparts)}")
	if (duelist.id == obj_dm.player1.id) {
		array_delete(obj_player.bodyparts, bp_index, 1);
		array_insert(obj_player.bodyparts, bp_index, new_bp.index_number)
		// associated card replacement
		var replaced = false;
		for(var i=0;i<array_length(player1_cards) && !replaced;i++) {
			if (player1_cards[i] == old_bp.index_number) {
				replaced = true;
				player1_cards[i] = new_bp_index_number;
			}
		}
		for (var i=0;i<array_length(player1_discard) && !replaced;i++) {
			if (player1_discard[i] == old_bp.index_number) {
				replaced = true;
				player1_discard[i] = new_bp_index_number;
			}
		}
	} else {
		var replaced = false;
		for(var i=0;i<array_length(player2_cards) && !replaced;i++) {
			if (player2_cards[i] == old_bp.index_number) {
				replaced = true;
				player2_cards[i] = new_bp_index_number;
			}
		}
		for (var i=0;i<array_length(player2_discard) && !replaced;i++) {
			if (player2_discard[i] == old_bp.index_number) {
				replaced = true;
				player2_discard[i] = new_bp_index_number;
			}
		}
		
	}
	
	instance_destroy(old_bp);
}

postDuelCleanup = function() {
	phase = "POST_DUEL";
	cleanupDuel();
}
// start the duel!
goToDraw();