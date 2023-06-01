/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (1) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die, {live: false, shows:4});
			array_push(pool, attack_die);
		}
	}
	return pool;
}


checkFlipCondition = function(card) {
	var buzzsaw_bps = [];
	for (var i=0;i<array_length(card.controller.bodyparts);i++) {
		if card.controller.bodyparts[i].object_index == obj_bp041_buzzsaw_arm {
			array_push(buzzsaw_bps, card.controller.bodyparts[i]);
		}
	}
	var has_full_health = false;
	for (var i=0;i<array_length(buzzsaw_bps);i++) {
		if (buzzsaw_bps[i].hp == 2) {
			has_full_health = true;	
		}
	}
	if (has_full_health) {
		with(card){
			event_user(0);
		}
	}
}