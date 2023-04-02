/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (3) {
			red_die = instance_create_layer(0, 0, "Pieces", obj_red_die);
			array_push(pool, red_die);
		}
		repeat (2) {
			green_die = instance_create_layer(0, 0, "Pieces", obj_green_die);
			array_push(pool, green_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	
}

checkFlipCondition = function(card) {
	if (!card.controller.hasEffect(obj_eff_flight)) {
		with(card){
			event_user(0);
		}
	}
}