/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (3) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
			array_push(pool, attack_die);
		}
		repeat (3) {
			red_die = instance_create_layer(0, 0, "Pieces", obj_red_die);
			array_push(pool, red_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_r_factor(1);
}

checkFlipCondition = function(card) {
	if (card.controller.r_factor > card.controller.b_factor) {
		with(card){
			event_user(0);
		}
	}
}