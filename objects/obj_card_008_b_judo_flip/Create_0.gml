/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (1) {
			green_die = instance_create_layer(0, 0, "Pieces", obj_green_die, {live: false, shows: 5});
			array_push(pool, green_die);
		}
		repeat (1) {
			red_die = instance_create_layer(0, 0, "Pieces", obj_red_die, {live: false, shows: 5});
			array_push(pool, red_die);
		}
		repeat (1) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die, {live: false, shows: 5});
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.r_factor = clamp(card.controller.r_factor+1, 0, card.controller.r_ceiling);
}

checkFlipCondition = function(card) {
	if (card.controller.r_factor > card.controller.g_factor) {
		with(card){
			event_user(0);
		}
	}
}