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
		repeat (4) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die);
			array_push(pool, defense_die);
		}
	}
	return pool;
}

checkFlipCondition = function(card) {
	if (card.controller.b_factor > 1) {
		with(card){
			event_user(0);
		}
	}
}

cleanupEffect = function(card) {
	card.controller.b_factor = clamp(card.controller.b_factor+1, 0, card.controller.b_ceiling);
}