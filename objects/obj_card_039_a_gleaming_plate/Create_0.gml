/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die, {live: false, shows: 6});
			array_push(pool, defense_die);
		}
	}
	return pool;
}

checkFlipCondition = function(card) {
	var gleam_plate_bps = [];
	for (var i=0;i<array_length(card.controller.bodyparts);i++) {
		if card.controller.bodyparts[i].object_index == obj_bp039_bright_plate {
			array_push(gleam_plate_bps, card.controller.bodyparts[i]);
		}
	}
	var has_full_health = false;
	for (var i=0;i<array_length(gleam_plate_bps);i++) {
		if (gleam_plate_bps[i].hp == 2) {
			has_full_health = true;	
		}
	}
	if (!has_full_health) {
		with(card){
			event_user(0);
		}
	}
}