/// @description Insert description here
// You can write your code in this editor
event_inherited();

brutal = true;

getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (controller.r_factor) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
			blue_die = instance_create_layer(0, 0, "Pieces", obj_blue_die);
			array_push(pool, attack_die);
			array_push(pool, blue_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_b_factor(card.controller.r_factor);
	card.controller.r_factor = 0;
}

checkFlipCondition = function(card) {
	if (card.controller.r_factor < card.controller.g_factor) {
		with(card){
			event_user(0);
		}
	}
}