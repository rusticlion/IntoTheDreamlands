/// @description Insert description here
// You can write your code in this editor
event_inherited();
body = [11,11,11,11,11,11]
gadgets = [
	{
		xx: 13*global.tile_size,
		yy: 4*global.tile_size,
		gadget_index: 10
	},
	{
		xx: 13*global.tile_size,
		yy: 6*global.tile_size,
		gadget_index: 11
	},
	{
		xx: 13*global.tile_size,
		yy: 8*global.tile_size,
		gadget_index: 12
	}
]

getBody = function(ai_opponent) {
	switch (ai_opponent)
	{
		case "DRAGON":
			body = [4,10,13,13,1,1];
		break;
		case "BONE DEMON":
			body = [6,9,11,2,11,2];
		break;
		case "KRAKEN":
			body = [3,7,2,2,2,2];
		break;
		case "BONE GARGOYLE":
			body = [6,8,13,13,1,1];
		break;
		case "MANTIS SENSEI":
			body = [3,8,12,12,12,12];
		break;
		case "TREASURE WIGHT":
			body = [6,10,11,11,11,11];
		break;
		case "CHESHIRE LION":
			body = [5,10,1,1,1,2];
		break;
		
	}
	return body;
}

getGadgets = function(ai_opponent) {
	switch (ai_opponent)
	{
		case "DRAGON":

		break;
		default:
			
		break;
		
	}
	return gadgets;
}

getDeck = function(ai_opponent) {
	body = getBody(ai_opponent);
	return array_shuffle(body);	
}

AIAssignDice_BasicRandom = function() {
	var white_dice = [];
	var black_dice = [];
	var red_dice = [];
	var green_dice = [];
	var blue_dice = [];
	for(i=0;i<array_length(dice_pool);i++) {
		switch(dice_pool[i].object_index) {
			case obj_white_die:
				array_push(white_dice, dice_pool[i]);
				break;
			case obj_blk_die:
				array_push(black_dice, dice_pool[i]);
				break;
			case obj_red_die:
				array_push(red_dice, dice_pool[i]);
				break;
			case obj_green_die:
				array_push(green_dice, dice_pool[i]);
				break;
			case obj_blue_die:
				array_push(blue_dice, dice_pool[i]);
				break;
			default:
				break;
		}
	}
	var bp_count_set = [];
	var bp_count_index = 0;
	
	repeat (array_length(bodyparts)) {
		array_push(bp_count_set, bp_count_index);
		bp_count_index++;
	}
	
	// "targeting" is the set of (0,1,2,3,4,5) in a random order
	
	// Assign basic defenses
	var targeting = array_shuffle(bp_count_set);
	
	var _exclude_own_maimed_bps = function(_el, _idx) {
		if (bodyparts[_el].hp > 0) {
			return true
		} else {
			return false	
		}
	}
	var _map_indexes_to_bp_defense_slots = function(_el, _idx) {
		return bodyparts[_el].defense_slot;	
	}
	var valid_defense_target_indexes = array_filter(targeting, _exclude_own_maimed_bps);
	var valid_defense_slots = array_map(valid_defense_target_indexes, _map_indexes_to_bp_defense_slots);
	
	var counter = 0; // counts off each dice pool
	while(array_length(white_dice)>0 && counter<array_length(valid_defense_slots))
	{
		var next_die = array_pop(white_dice);
		var slot_to_defend = valid_defense_slots[counter];
		next_die.x = slot_to_defend.x;
		next_die.y = slot_to_defend.y;
		slot_to_defend.apply(next_die);
		counter++;
	}
	// Assign basic attacks
	targeting = array_shuffle(targeting);
	
	var _exclude_opponent_maimed_bps = function(_el, _idx) {
		if (opponent.bodyparts[_el].hp > 0) {
			return true
		} else {
			return false	
		}
	}
	var _map_indexes_to_bp_attack_slots = function(_el, _idx) {
		return opponent.bodyparts[_el].attack_slot;	
	}
	var valid_attack_target_indexes = array_filter(targeting, _exclude_opponent_maimed_bps);
	var valid_attack_slots = array_map(valid_attack_target_indexes, _map_indexes_to_bp_attack_slots);
	
	counter = 0;
	while(array_length(black_dice)>0 && counter<array_length(valid_attack_slots))
	{
		var next_die = array_pop(black_dice);
		var slot_to_attack = valid_attack_slots[counter];
		next_die.x = slot_to_attack.x;
		next_die.y = slot_to_attack.y;
		slot_to_attack.apply(next_die);
		counter++;
	}
	// Assign some blue dice as attacks
	targeting = array_shuffle(targeting);
	
	var _exclude_opponent_maimed_or_filled_bps = function(_el, _idx) {
		if (opponent.bodyparts[_el].hp < 1) {
			return false;
		} else if (opponent.bodyparts[_el].attack_slot != noone) {
			return false;
		} else {
			return true;
		}
	}
	var _map_indexes_to_bp_attack_slots = function(_el, _idx) {
		return opponent.bodyparts[_el].attack_slot;	
	}
	var valid_attack_target_indexes = array_filter(targeting, _exclude_opponent_maimed_or_filled_bps);
	var valid_attack_slots = array_map(valid_attack_target_indexes, _map_indexes_to_bp_attack_slots);
	
	counter = 0;
	how_many_blues_to_use_as_attacks = irandom(array_length(blue_dice))
	while((array_length(blue_dice)>0 && counter<array_length(valid_attack_slots)) && counter<how_many_blues_to_use_as_attacks)
	{
		var next_die = array_pop(blue_dice);
		var slot_to_attack = valid_attack_slots[counter];
		next_die.x = slot_to_attack.x;
		next_die.y = slot_to_attack.y;
		slot_to_attack.apply(next_die);
		counter++;
	}
	
	// Assign remaining blue dice as defenses
	targeting = array_shuffle(targeting);
	
	var _exclude_own_maimed_or_filled_bps = function(_el, _idx) {
		if (bodyparts[_el].hp < 1) {
			return false;
		} else if (bodyparts[_el].defense_slot != noone) {
			return false;
		} else {
			return true;
		}
	}
	var _map_indexes_to_bp_defense_slots = function(_el, _idx) {
		return bodyparts[_el].defense_slot;	
	}
	var valid_defense_target_indexes = array_filter(targeting, _exclude_own_maimed_or_filled_bps);
	var valid_defense_slots = array_map(valid_defense_target_indexes, _map_indexes_to_bp_defense_slots);
	
	counter = 0;
	while(array_length(blue_dice)>0 && counter<array_length(valid_defense_slots))
	{
		var next_die = array_pop(blue_dice);
		var slot_to_defend = valid_defense_slots[counter];
		next_die.x = slot_to_defend.x;
		next_die.y = slot_to_defend.y;
		slot_to_defend.apply(next_die);
		counter++;
	}
	
	// Assign greens to any valid defense
	var targeting = array_shuffle(bp_count_set);
	
	var _exclude_own_maimed_bps = function(_el, _idx) {
		if (bodyparts[_el].hp > 0) {
			return true
		} else {
			return false	
		}
	}
	var _map_indexes_to_bp_defense_slots = function(_el, _idx) {
		return bodyparts[_el].defense_slot;	
	}
	var valid_defense_target_indexes = array_filter(targeting, _exclude_own_maimed_bps);
	var valid_defense_slots = array_map(valid_defense_target_indexes, _map_indexes_to_bp_defense_slots);
	
	var counter = 0; // counts off each dice pool
	while(array_length(green_dice)>0 && counter<array_length(valid_defense_slots))
	{
		var next_die = array_pop(green_dice);
		var slot_to_defend = valid_defense_slots[counter];
		next_die.x = slot_to_defend.x;
		next_die.y = slot_to_defend.y;
		slot_to_defend.apply(next_die);
		counter++;
	}
	// Assign reds to any valid attack
	targeting = array_shuffle(targeting);
	
	var _exclude_opponent_maimed_bps = function(_el, _idx) {
		if (opponent.bodyparts[_el].hp > 0) {
			return true
		} else {
			return false	
		}
	}
	var _map_indexes_to_bp_attack_slots = function(_el, _idx) {
		return opponent.bodyparts[_el].attack_slot;	
	}
	var valid_attack_target_indexes = array_filter(targeting, _exclude_opponent_maimed_bps);
	var valid_attack_slots = array_map(valid_attack_target_indexes, _map_indexes_to_bp_attack_slots);
	
	counter = 0;
	while(array_length(red_dice)>0 && counter<array_length(valid_attack_slots))
	{
		var next_die = array_pop(red_dice);
		var slot_to_attack = valid_attack_slots[counter];
		next_die.x = slot_to_attack.x;
		next_die.y = slot_to_attack.y;
		slot_to_attack.apply(next_die);
		counter++;
	}
}
