/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (6) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die, {live: false, shows: controller.r_factor});
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.addEffect(obj_eff_frenzy);
	card.controller.blood = 3;
	card.controller.opponent.addEffect(obj_eff_frenzy);
}

checkFlipCondition = function(card) {
	if (card.controller.hasEffect(obj_eff_frenzy)) {
		with(card){
			event_user(0);
		}
	}
}