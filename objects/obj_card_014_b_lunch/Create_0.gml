/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat(2) {
			die = instance_create_layer(0,0,"Pieces",obj_white_die);
			array_push(pool, die);
		}
		repeat(1) {
			red_die = instance_create_layer(0,0,"Pieces",obj_red_die, {live: false, shows: 5});
			array_push(pool, red_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	var randomized_bps = array_shuffle(card.controller.bodyparts);
	var done = false;
	var counter = 0;
	while(!done && counter<6){
		if(randomized_bps[counter].hp < 2) {
			randomized_bps[counter].heal(1);
			card.controller.blood += 1;
			done = true;
		}
		counter++;
	}
}


checkFlipCondition = function(card) {
	if (card.controller.blood > 2) {
		with(card){
			event_user(0);
		}
	}
}