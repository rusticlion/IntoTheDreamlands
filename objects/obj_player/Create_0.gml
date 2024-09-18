/// @description Insert description here
// You can write your code in this editor
moving = false;
momentum = 0;
image_speed = 0;
win_count = 0;
dreamform = "BASIC PERSON";
should_wake = false;

equipped_item = noone;
realworld_items = [];
dreamlands_items = [];

for (var i=0;i<array_length(global.realworld_items);i++) {
	var loaded_item_index = global.realworld_items[i];
	var item_object_index = global.item_index[loaded_item_index];
	var reified_item = instance_create_layer(0,0,layer,item_object_index);
	array_push(realworld_items, reified_item);
}
for (var i=0;i<array_length(global.dreamlands_items);i++) {
	var loaded_item_index = global.dreamlands_items[i];
	var item_object_index = global.item_index[loaded_item_index];
	var reified_item = instance_create_layer(0,0,layer,item_object_index);
	array_push(dreamlands_items, reified_item);
}

facing_tile_x = x;
facing_tile_y = y+global.tile_size;

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

default_bodyparts = [45,44,42,42,43,43];
var default_gadgets = [
	{
		xx: 1*global.tile_size,
		yy: 0,
		gadget_index: 4
	},
	{
		xx: 1*global.tile_size,
		yy: 2*global.tile_size,
		gadget_index: 5
	},
	{
		xx: 1*global.tile_size,
		yy: 4*global.tile_size,
		gadget_index: 6
	},
	{
		xx: 2*global.tile_size,
		yy: 0,
		gadget_index: 7
	},
	{
		xx: 2*global.tile_size,
		yy: 2*global.tile_size,
		gadget_index: 8
	},
	{
		xx: 2*global.tile_size,
		yy: 4*global.tile_size,
		gadget_index: 9
	},
	{
		xx: 3*global.tile_size,
		yy: 0,
		gadget_index: 14
	}
];
equipped_gadgets = loadEquippedGadgetsFromGlobal();
if (array_length(equipped_gadgets) < 1) {
	equipped_gadgets = default_gadgets;	
}
unlocked_gadgets = loadUnlockedGadgetsFromGlobal();
if (array_length(unlocked_gadgets) < 1) {
	unlocked_gadgets = default_gadgets;	
}

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
	return equipped_gadgets;	
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

removeItem = function(item_index) {
	item_to_remove = item_index;
	if item_to_remove = equipped_item.object_index {
		equipped_item = noone;	
	}
	if (hasItem(item_index)) {
		function itemCheck(element, index) {
			return element.object_index != item_to_remove;
		}
		if global.phase == "REAL WORLD" {
			var filtered_items = array_filter(realworld_items, itemCheck);
			realworld_items = filtered_items;
		} else {	
			var filtered_items = array_filter(dreamlands_items, itemCheck);
			dreamlands_items = filtered_items;
		}
	} else {
		show_debug_message("Warning: tried to remove an item the player did not have");
	}	
}

hasItem = function(item_index) {
	has = false;
	var items = getItems();
	for(var i=0;i<array_length(items);i++) {
		if items[i].object_index == item_index {
			has = true;	
		}
	}
	return has;
}

hasEquipped = function(item_index) {
	if (equipped_item == noone) {
		return false;	
	} else if (equipped_item.object_index == item_index) {
		return true;
	} else {
		return false;	
	}
}

gainBP = function(bp_location_index, bp_id_index) {
	bodyparts[bp_location_index] = bp_id_index;
	bodyparts_hp[bp_location_index] = 2;
	show_debug_message("Got to Gain BP method");
	obj_dm.postDuelCleanup();
}

stops = function() {
	target = instance_place(x,y,obj_permeable_actor);
	if (target != noone) {
		with (target) {
			event_user(2);
		}
	}
}

walks = function() {
	target = instance_place(x,y,obj_permeable_actor);
	if (target != noone) {
		with (target) {
			event_user(3);
		}
	}
}