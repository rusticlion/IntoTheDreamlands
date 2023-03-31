/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (6) {
			defense_die = instance_create_layer(0, 0, "Pieces", obj_white_die, {shows: 4, live: false});
			array_push(pool, defense_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.addEffect(obj_eff_invisible);
}

checkFlipCondition = function(card) {
	var is_invisible = false;
	for (var i=0;i<array_length(card.controller.effects);i++){
		if (card.controller.effects[i].object_index == obj_eff_invisible) {
			is_invisible = true;
		}
	}
	if (is_invisible) {
		with(card){
			event_user(0);
		}
	}
}