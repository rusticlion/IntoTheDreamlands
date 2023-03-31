/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (controller.g_factor) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die);
			array_push(pool, defense_die);
			blue_die = instance_create_layer(0, 0, "Pieces", obj_blue_die);
			array_push(pool, blue_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.addEffect(obj_eff_invisible);
	card.controller.modify_b_factor(card.controller.g_factor);
	card.controller.g_factor = 0;
}

checkFlipCondition = function(card) {
	if (card.controller.g_factor < card.controller.r_factor) {
		with(card){
			event_user(0);
		}
	}
}