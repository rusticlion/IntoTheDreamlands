/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (4) {
		attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
		array_push(pool, attack_die);
	}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.g_factor = clamp(card.controller.g_factor+1, 0, card.controller.g_ceiling);
}


checkFlipCondition = function(card) {
	if (card.controller.g_factor > card.controller.r_factor) {
		with(card){
			event_user(0);
		}
	}
}