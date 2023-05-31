/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (1) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die, { live: false, shows: 4});
			array_push(pool, defense_die);
		}
		repeat (1) {
			green_die = instance_create_layer(0, 0, "Pieces", obj_white_die, {live: false, shows: 3});
			array_push(pool, green_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_g_factor(1);
	card.controller.modify_r_factor(1);
}

checkFlipCondition = function(card) {
	if (card.controller.r_factor > 1)
	{
		with(card) { event_user(0) }
	}
}