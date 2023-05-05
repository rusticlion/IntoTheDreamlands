/// @description Insert description here
// You can write your code in this editor
moving = false;
momentum = 0;
image_speed = 0;
win_count = 0;
dreamform = "BEAST MAN";

equipped_item = noone;
realworld_items = [];
dreamlands_items = [];

for (var i=0;i<array_length(global.realworld_items);i++) {
	var reified_item = instance_create_layer(0,0,layer,item_index);
	array_push(realworld_items, reified_item);
}
for (var i=0;i<array_length(global.dreamlands_items);i++) {
	var reified_item = instance_create_layer(0,0,layer,item_index);
	array_push(dreamlands_items, reified_item);
}

facing_tile_x = x;
facing_tile_y = y+16;

switch(global.player_sprite) {
	case 0:
		left_sprite = spr_player_walkleft;
		right_sprite = spr_player_walkright;
		down_sprite = spr_player_walkdown;
		up_sprite = spr_player_walkup;
	break;
	case 1:
		left_sprite = spr_player_2_walkleft;
		right_sprite = spr_player_2_walkright;
		down_sprite = spr_player_2_walkdown;
		up_sprite = spr_player_2_walkup;
	break;
	default:
		left_sprite = spr_debug_duck;
		right_sprite = spr_debug_duck;
		down_sprite = spr_debug_duck;
		up_sprite = spr_debug_duck;
	break;
}
sprite_index = down_sprite;

bodyparts = loadBodyFromGlobal();
bodyparts_hp = loadBodyHPFromGlobal();
gadgets = [
	{
		xx: 1*global.tile_size,
		yy: 20*global.tile_size,
		gadget_index: 4
	},
	{
		xx: 1*global.tile_size,
		yy: 22*global.tile_size,
		gadget_index: 5
	},
	{
		xx: 1*global.tile_size,
		yy: 24*global.tile_size,
		gadget_index: 6
	},
	{
		xx: 2*global.tile_size,
		yy: 20*global.tile_size,
		gadget_index: 7
	},
	{
		xx: 2*global.tile_size,
		yy: 22*global.tile_size,
		gadget_index: 8
	},
	{
		xx: 2*global.tile_size,
		yy: 24*global.tile_size,
		gadget_index: 9
	},
];

getItems = function() {
	if (global.phase == "REAL WORLD") {
		return realworld_items;
	} else if (global.phase == "DREAMLANDS") {
		return dreamlands_items;
	} else {
		show_debug_message("! Tried to get items when not in an overworld phase");	
	}
}

lock = function() {
	moving = true;
}
unlock = function() {
	moving = false;	
}

isLocked = function() {
	if moving {
		return true;
	} else {
		return false;
	}
}

getDeck = function() {
	return array_shuffle(bodyparts);	
}

getBody = function() {
	// bodyparts = obj_ai_duelist.getBody(dreamform);
	return bodyparts;	
}

getGadgets = function() {
	return gadgets;	
}

registerWin = function(opp_name) {
	var already_unlocked = false;
	for (var i=0;i<array_length(global.dreamforms_unlocked);i++) {
		if (opp_name == global.dreamforms_unlocked[i]) {
			already_unlocked = true;
		}
	}
	if (!already_unlocked) {
		array_push(global.dreamforms_unlocked, opp_name);
	}
}

gainItem = function(item_index) {
	var reified_item = instance_create_layer(0,0,layer,item_index);
	array_push(getItems(), reified_item);
}
