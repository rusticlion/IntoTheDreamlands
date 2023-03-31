/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (2) {
			green_die = instance_create_layer(0, 0, "Pieces", obj_green_die);
			array_push(pool, green_die);
		}
		repeat (2) {
			blue_die = instance_create_layer(0, 0, "Pieces", obj_blue_die);
			array_push(pool, blue_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.addEffect(obj_eff_prophecy);
}

checkFlipCondition = function(card) {
	var has_prophecy = false;
	for (var i=0;i<array_length(card.controller.effects);i++){
		if (card.controller.effects[i].object_index == obj_eff_prophecy) {
			has_prophecy = true;
		}
	}
	if (has_prophecy) {
		with(card){
			event_user(0);
		}
	}
}