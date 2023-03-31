/// @description Insert description here
// You can write your code in this editor

// pass this stuff in as a struct for world battles

global.bodypart_index = [
obj_bp001_tentacle,
obj_bp002_massive_eye,
obj_bp003_fleshy_mantle
]

global.card_index = [
obj_card_001,
obj_card_002
]

player1_cards = [0];
player1_bodypart_list = [1, 2, 0, 0, 0, 0];

player2_cards = [0];
player2_bodypart_list = [0, 0, 1, 2, 0, 0];

// these are real (singleton) instance var inits
gameView = "home";

// player and misc manager instantiations
player1 = instance_create_layer(
	0,
	0,
	"Managers",
	obj_duelist,
	{
		duelist_id: "player1",
		deck: player1_cards,
		bodyparts: player1_bodypart_list,
	}
);
player2 = instance_create_layer(
	0,
	0,
	"Managers",
	obj_duelist,
	{
		duelist_id: "player2",
		deck: player2_cards,
		bodyparts: player2_bodypart_list,
	}
);
dialog = instance_create_layer(
	0,
	0,
	"Overlay",
	obj_duel_dialog_box
);

// game piece instantiations
for (var i = 0; i < 6; i+= 1) {
	instance_create_layer(
	209,
	322+i*16, //magic number p1_y_offset
	"Pieces",
	global.bodypart_index[player1.bodyparts[i]],
	{
		player: player1
	}
	);
}

for (var i = 0; i < 6; i+=1) { // magic number 6 is BP count
	instance_create_layer(
	1, // space into slots
	66+i*16, //magic number p2_y_offset
	"Pieces",
	global.bodypart_index[player2.bodyparts[i]],
	{
		player: player2
	}
	);
}

instance_create_layer(112, 320, "Pieces", obj_go_btn);

function goToTradeBlows() {
	gameView = "clash";
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	with (_cameraman) {
		event_user(1);
	}
	obj_mouse_cursor.y += 80;
	
}

function updateGame(){
	var p1_dice_pool = {
		red: player1.a_factor + player1.active_card.red_dice,
		green: player1.b_factor + player1.active_card.green_dice,
		blue: player1.c_factor + player1.active_card.blue_dice,
		black: player1.active_card.black_dice,
		white: player1.active_card.white_dice
	}
	
	
}