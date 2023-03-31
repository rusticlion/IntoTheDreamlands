/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (1 + controller.r_factor) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
			array_push(pool, attack_die);
		}
		repeat (1 + controller.g_factor) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die);
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.r_factor = clamp(card.controller.r_factor+1, 0, card.controller.r_ceiling);
}

checkFlipCondition = function(card) {
	if (card.controller.g_factor > card.controller.r_factor) {
		with(card){
			event_user(0);
		}
	}
}