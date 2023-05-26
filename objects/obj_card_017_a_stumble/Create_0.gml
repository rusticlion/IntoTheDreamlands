/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die);
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_g_factor(1);
}

checkFlipCondition = function(card) {
	if (card.controller.g_factor < card.controller.r_factor)
	{
		with(card) { event_user(0) }
	}
}