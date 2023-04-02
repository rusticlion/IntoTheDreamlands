/// @description Insert description here
// You can write your code in this editor
event_inherited();
brutal = true;
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
			red_die = instance_create_layer(0, 0, "Pieces", obj_red_die, {live: false, shows:6});
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
	card.controller.removeEffect(obj_eff_mantis_style);
}

checkFlipCondition = function(card) {
	if (!card.controller.hasEffect(obj_eff_mantis_style)) {
		with(card){
			event_user(0);
		}
	}
}