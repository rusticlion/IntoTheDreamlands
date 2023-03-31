/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		var white_eight = instance_create_layer(0, 0, "Pieces", obj_white_die, {live: false, shows: 8, target_value: 8});
		var black_eight = instance_create_layer(0, 0, "Pieces", obj_blk_die, {live: false, shows: 8, target_value: 8});
		array_push(pool, white_eight);
		array_push(pool, black_eight);
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.b_factor = 0;
}


checkFlipCondition = function(card) {
	if (card.controller.b_factor < 2) {
		with(card){
			event_user(0);
		}
	}
}