/// @description Insert description here
// You can write your code in this editor
event_inherited();

clashEffect = function(card) {
	card.controller.addEffect(obj_eff_splendor);
}

getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		// no dice, splendor is enough
	}
	return pool;
}

checkFlipCondition = function(card) {
	var has_splendor = false;
	for (var i=0;i<array_length(card.controller.effects);i++){
		if (card.controller.effects[i].object_index == obj_eff_splendor) {
			has_splendor = true;
		}
	}
	if (has_splendor) {
		with(card) {
			event_user(0);
		}
	}
}