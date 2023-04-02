/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
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
	if (card.controller.hasEffect(obj_eff_flight)) {
		with(card){
			event_user(0);
		}
	}
}