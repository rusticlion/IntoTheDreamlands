/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
			array_push(pool, attack_die);
		}
		repeat (2) {
			green_die = instance_create_layer(0, 0, "Pieces", obj_green_die);
			array_push(pool, green_die);
		}
	}
	return pool;
}

checkFlipCondition = function(card) {
	if (card.controller.blood < 2) {
		with(card){
			event_user(0);
		}
	}
}

cleanupEffect = function(card) {
	card.controller.modify_r_factor(1);
}