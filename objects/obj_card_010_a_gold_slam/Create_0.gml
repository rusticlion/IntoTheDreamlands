/// @description Insert description here
// You can write your code in this editor
event_inherited();

getDice = function(controller = noone) {
	show_debug_message("fetching dice for GOLD SLAM");
	var pool = [];
	if (controller) {
		repeat (1+controller.r_factor) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
			array_push(pool, attack_die);
		}
		repeat (1+controller.g_factor) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die);
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_b_factor(1);
}

checkFlipCondition = function(card) {
	if (card.controller.hasEffect(obj_eff_splendor)) {
		// don't flip if already splendor'd
	} else if ((card.controller.r_factor+card.controller.g_factor+card.controller.b_factor)>5) {
		with(card){
			event_user(0);
		}
	}
}