/// @description Insert description here
// You can write your code in this editor
event_inherited();

body = [11,11,11,11,11,11]
equipped_gadgets = [
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
];

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
		case "BEAST MAN":
			body = [3,8,1,1,1,1];
		break;
		case "ZOMBIE":
			body = [15, 14, 16, 16, 17, 17];
		break;
		case "MURDERER":
			body = [20,8,18,19,17,17];
		break;
		case "TOTAL DUMMY":
			body = [35,34,33,33,32,32];
		break;
		case "BLOOD DEMON":
			body = [18, 14, 18, 3, 18, 3];
		break;
		case "BASIC PERSON":
			body = [45,44,42,42,43,43]
		break;
		case "WHAP-O-MATIC":
			body = [35,34,36,36,32,32];
		break;
		case "ARMORED DUMMY":
			body = [40,39,37,37,38,38];
		break;
		case "CHAINSAW-O-MATIC":
			body = [35,34,41,41,32,32];
		break;
		case "PROFESSOR DUMMY":
			body = [40,39,41,37,38,38];
		break;
		default:
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
	return equipped_gadgets;
}

getDeck = function(ai_opponent) {
	body = getBody(ai_opponent);
	return array_shuffle(body);	
}

move_queue = [];

queueMove = function(die, slot) {
	var move = {
		die: die,
		slot: slot
	}
	array_push(move_queue, move);
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
		queueMove(next_die, slot_to_defend);
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
		queueMove(next_die, slot_to_attack);
		counter++;
	}
	// Assign some blue dice as attacks
	targeting = array_shuffle(targeting);
	
	var _exclude_opponent_maimed_or_filled_bps = function(_el, _idx) {
		if (opponent.bodyparts[_el].hp < 1) {
			return false;
		} else if (opponent.bodyparts[_el].attack_slot.contains != noone) {
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
	show_debug_message("just decided to use this many blue dice as attacks: "+string(how_many_blues_to_use_as_attacks));
	while((array_length(blue_dice)>0 && counter<array_length(valid_attack_slots)) && counter<how_many_blues_to_use_as_attacks)
	{
		var next_die = array_pop(blue_dice);
		var slot_to_attack = valid_attack_slots[counter];
		queueMove(next_die, slot_to_attack);
		counter++;
	}
	
	// Assign remaining blue dice as defenses
	targeting = array_shuffle(targeting);
	
	var _exclude_own_maimed_or_filled_bps = function(_el, _idx) {
		if (bodyparts[_el].hp < 1) {
			return false;
		} else if (bodyparts[_el].defense_slot.contains != noone) {
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
		queueMove(next_die, slot_to_defend);
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
		queueMove(next_die, slot_to_defend);
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
		queueMove(next_die, slot_to_attack);
		counter++;
	}
}


AIAssignDice_DefendHeadAndBody = function() {
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
	
	var diceSorter = function(d_1, d_2) {
		if d_1.shows > d_2.shows {
			return -1;
		} else if d_1.shows < d_2.shows {
			return 1;
		} else {
			return 0;
		}
	}
	
	array_sort(white_dice, diceSorter);
	array_sort(black_dice, diceSorter);
	array_sort(red_dice, diceSorter);
	array_sort(green_dice, diceSorter);
	array_sort(blue_dice, diceSorter);
	
	var own_bp_list = bodyparts;
	var prioritized_bp_list = [];
	for (var i=0;i<array_length(own_bp_list);i++) {
		var bodypart_to_analyze = own_bp_list[i];
		if (bodypart_to_analyze.bp_class == "HEAD" && bodypart_to_analyze.hp>0) {
			array_push(prioritized_bp_list, own_bp_list[i]);
		}
	}
	for (var i=0;i<array_length(own_bp_list);i++) {
		var bodypart_to_analyze = own_bp_list[i];
		if (bodypart_to_analyze.bp_class == "BODY" && bodypart_to_analyze.hp>0) {
			array_push(prioritized_bp_list, own_bp_list[i]);
		}
	}
	own_bp_list = array_shuffle(own_bp_list);
	for (var i=0;i<array_length(own_bp_list);i++) {
		var bodypart_to_analyze = own_bp_list[i];
		if (bodypart_to_analyze.bp_class == "LIMB" && bodypart_to_analyze.hp>0) {
			array_push(prioritized_bp_list, own_bp_list[i]);
		}
	}
	show_debug_message("ai has this defense plan:")
	var bug_msg = []
	for (var i=0;i<array_length(prioritized_bp_list);i++) {
		array_push(bug_msg, prioritized_bp_list[i].hover_text)
	}
	show_debug_message(bug_msg)
	
	var opponent_bp_list = opponent.bodyparts;
	var prioritized_bp_hit_list = [];
	for (var i=0;i<array_length(opponent_bp_list);i++) {
		var bodypart_to_analyze = opponent_bp_list[i];
		if (bodypart_to_analyze.bp_class == "HEAD" && bodypart_to_analyze.hp>0) {
			array_push(prioritized_bp_hit_list, opponent_bp_list[i]);
		}
	}
	for (var i=0;i<array_length(opponent_bp_list);i++) {
		var bodypart_to_analyze = opponent_bp_list[i];
		if (bodypart_to_analyze.bp_class == "BODY" && bodypart_to_analyze.hp>0) {
			array_push(prioritized_bp_hit_list, opponent_bp_list[i]);
		}
	}
	opponent_bp_list = array_shuffle(opponent_bp_list);
	for (var i=0;i<array_length(opponent_bp_list);i++) {
		var bodypart_to_analyze = opponent_bp_list[i];
		if (bodypart_to_analyze.bp_class == "LIMB" && bodypart_to_analyze.hp>0) {
			array_push(prioritized_bp_hit_list, opponent_bp_list[i]);
		}
	}
	show_debug_message("ai has this attack plan:")
	var bug_msg = []
	for (var i=0;i<array_length(prioritized_bp_hit_list);i++) {
		array_push(bug_msg, prioritized_bp_hit_list[i].hover_text)
	}
	show_debug_message(bug_msg)
	// "" is the set of body parts in a random order, except
	// for the priorities [HEAD,BODY,LIMB], with maimed targets excluded
	
	// pool blues together with attacks and defenses
	while (array_length(blue_dice)>0) {
		var next_b = array_pop(blue_dice);
		var bit = irandom(1);
		if (bit==0) {
			array_push(white_dice, next_b);
		} else {
			array_push(black_dice, next_b);
		}
	}
	
	array_sort(white_dice, diceSorter);
	array_sort(black_dice, diceSorter);
	
	// Assign basic and blue defenses
	var counter = 0; // counts off each dice pool
	while(array_length(white_dice)>0 && counter<array_length(prioritized_bp_list))
	{
		var next_die = array_pop(white_dice);
		var slot_to_defend = prioritized_bp_list[counter].defense_slot;
		queueMove(next_die, slot_to_defend);
		counter++;
	}
	// Assign basic and blue attacks
	counter = 0;
	while(array_length(black_dice)>0 && counter<array_length(prioritized_bp_hit_list))
	{
		var next_die = array_pop(black_dice);
		var slot_to_attack = prioritized_bp_hit_list[counter].attack_slot;
		queueMove(next_die, slot_to_attack);
		counter++;
	}
	
	// Assign greens to any valid defense
	var counter = 0; // counts off each dice pool
	array_sort(green_dice, diceSorter); // test code, sometimes low dice getting assigned to high priority?
	while(array_length(green_dice)>0 && counter<array_length(prioritized_bp_list))
	{
		var next_die = array_pop(green_dice);
		var slot_to_defend = prioritized_bp_list[counter].defense_slot;
		queueMove(next_die, slot_to_defend);
		counter++;
	}
	// Assign reds to any valid attack
	counter = 0;
	array_sort(red_dice, diceSorter);
	while(array_length(red_dice)>0 && counter<array_length(prioritized_bp_hit_list))
	{
		var next_die = array_pop(red_dice);
		var slot_to_attack = prioritized_bp_hit_list[counter].attack_slot;
		queueMove(next_die, slot_to_attack);
		counter++;
	}
}