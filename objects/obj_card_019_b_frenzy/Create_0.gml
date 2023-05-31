/// @description Insert description here
// You can write your code in this editor
event_inherited();
brutal = true;
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (controller.r_factor) {
			red_die = instance_create_layer(0, 0, "Pieces", obj_red_die, {live: false, shows:1});
			array_push(pool, red_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_r_factor(1);
}

checkFlipCondition = function(card) {
	if (!card.controller.hasEffect(obj_eff_frenzy)) {
		with(card){
			event_user(0);
		}
	}
}