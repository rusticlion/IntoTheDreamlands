/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die, {live: false, shows: 3});
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.opponent.addEffect(obj_eff_frightened);	
}

checkFlipCondition = function(card) {
	if (card.controller.opponent.hasEffect(obj_eff_frightened)) {
		with(card){
			event_user(0);
		}
	}
}