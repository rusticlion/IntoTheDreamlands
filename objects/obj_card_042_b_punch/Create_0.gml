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
	}
	return pool;
}

checkFlipCondition = function(card) {
	if (card.controller.decision == "R") {
		with(card){
			event_user(0);
		}
	}
}