/// @description Insert description here
// You can write your code in this editor

// require:
// deck, bodyparts [Int]
r_factor = 0;
g_factor = 0;
b_factor = 0;
decision = "L";

displayed_r = r_factor;
displayed_g = g_factor;
displayed_b = b_factor;

r_dice_modifier = 0;
g_dice_modifier = 0;
b_dice_modifier = 0;

r_ceiling = 2;
g_ceiling = 2;
b_ceiling = 2;

energy = 0;

blood = 3;

active_card = noone;

dice_pool = [];
bodyparts = [];
effects = [];

curse_should_flip = false;

name = "Default Ducky";

refreshDicePool = function() {
	var pool_base_coordinate_x; // magic numbers to place the
	var pool_base_coordinate_y; // dice pool for each player
	if (obj_dm.player1.id == self.id) {
		pool_base_coordinate_x = 144;
		pool_base_coordinate_y = 336;
	} else {
		pool_base_coordinate_x = 48;
		pool_base_coordinate_y = 80;
	}
	
	// base dice pool from card
	for (i=0;i<array_length(dice_pool);i++) {
		instance_destroy(dice_pool[i]);
	}
	var card_pool = active_card.getDicePool();
	dice_pool = card_pool;
	
	// additional dice from gadgets
	repeat (r_dice_modifier) {
		array_push(dice_pool, instance_create_layer(0,0,"Pieces", obj_red_die, {owner: self}));
	}
	repeat (g_dice_modifier) {
		array_push(dice_pool, instance_create_layer(0,0,"Pieces", obj_green_die, {owner: self}));
	}
	repeat (b_dice_modifier) {
		array_push(dice_pool, instance_create_layer(0,0,"Pieces", obj_blue_die, {owner: self}));
	}
	
	// finally, allow effects to modify
	show_debug_message("about to apply fx to dice pool")
	show_debug_message("for player" + name)
	show_debug_message("fx arr:" + string(effects))
	for(var i=0;i<array_length(effects);i++) {
		dice_pool = effects[i].modifyDicePool(dice_pool);
	}
	
	next_die_x = pool_base_coordinate_x
	next_die_y = pool_base_coordinate_y
	for (i=0;i<array_length(dice_pool); i++) {
			dice_pool[i].x = next_die_x;
			dice_pool[i].y = next_die_y;
			if (i%3 == 2) { // every three dice, start a new row
				next_die_x = pool_base_coordinate_x;
				next_die_y += 16;
			} else {
				next_die_x += 16;
			}
	}
}

translateDicePool = function() {
	var pool_base_coordinate_x; // magic numbers to place the
	var pool_base_coordinate_y; // dice pool for each player
	if (obj_dm.player1.id == self.id) {
		pool_base_coordinate_x = 1+global.tile_size*4;
		pool_base_coordinate_y = 3+global.tile_size*18;
	} else {
		pool_base_coordinate_x = 2+global.tile_size*4;
		pool_base_coordinate_y = 2+global.tile_size*10;
	}
	
	next_die_x = pool_base_coordinate_x
	next_die_y = pool_base_coordinate_y
	for (i=0;i<array_length(dice_pool); i++) {
			dice_pool[i].x = next_die_x;
			dice_pool[i].y = next_die_y;
			if (i%7 == 6) {
				next_die_x = pool_base_coordinate_x;
				next_die_y += 16;
			} else {
				next_die_x += 16;
			}
	}
}

translateActiveCard = function() {
	if (obj_dm.player1.id == self.id) {
		active_card.x = 130;
		active_card.y = 226;
	} else {
		active_card.x = 66;
		active_card.y = 194;
	}
}

translateBodyParts = function() {
	if (obj_dm.player1.id == self.id) {
		for (i=0;i<array_length(bodyparts);i++) {
			bodyparts[i].y -= 128;
			if bodyparts[i].hp > 0 {
				bodyparts[i].defense_slot.y -= 128;
			}
		}
	} else {
		for (i=0;i<array_length(bodyparts);i++) {
			bodyparts[i].y += 128;
			if bodyparts[i].hp > 0 {
				bodyparts[i].defense_slot.y += 128;
			}
		}
	}
}

resetBodyParts = function() {
	if (obj_dm.player1.id == self.id) {
		for (i=0;i<array_length(bodyparts);i++) {
			bodyparts[i].y += 128;
			if bodyparts[i].hp > 0 {
				bodyparts[i].defense_slot.y += 128;
				bodyparts[i].defense_slot.reset();
				bodyparts[i].attack_slot.reset();
			}
		}
	} else {
		for (i=0;i<array_length(bodyparts);i++) {
			bodyparts[i].y -= 128;
			if bodyparts[i].hp > 0 {
				bodyparts[i].defense_slot.y -= 128;
				bodyparts[i].defense_slot.reset();
				bodyparts[i].attack_slot.reset();
			}
		}
	}
}


// an "effect index" is a valid object index for an Effect
addEffect = function(effect_index) {
	var effect_owner = self;
	
	already_present = hasEffect(effect_index);
	if (already_present) {
		show_debug_message("Tried to add an effect that is already present: doing nothing");;
	} else {
		var new_effect = instance_create_layer(0,0,"Pieces",effect_index,{owner: effect_owner});
		show_debug_message("Publishing new effects list for player"+name);
		show_debug_message(effects);
		array_push(effects, new_effect);
		translateEffects();
	}
}

hasEffect = function(effect_index) {
	var already_present = false; // effects don't stack
	for(var i=0;i<array_length(effects);i++) {
		if (effects[i].object_index == effect_index) {
			already_present = true;	
		}
	}
	return already_present;
}

removeEffect = function(effect_index) {
	if (hasEffect(effect_index)) {
		for(var i=0;i<array_length(effects);i++) {
			if effects[i].object_index == effect_index {
				effects[i].endEffect();
			}
		}
	} else {
		return false	
	}
}

translateEffects = function() {
	if (obj_dm.player1.id == self.id) {
		for(var i=0;i<array_length(effects);i++) {
			effects[i].x = 80+16*i;
			effects[i].y = 400;
		}
	} else {
		for(var i=0;i<array_length(effects);i++) {
			effects[i].x = 80+16*i;
			effects[i].y = 64;
		}
	}
}

modify_r_factor = function(delta) {
	var val_before_request = r_factor;
	r_factor = clamp(val_before_request+delta, 0, r_ceiling);
	if (r_factor != val_before_request) {
		return true;	
	} else {
		return false;	
	}
}

modify_g_factor = function(delta) {
	var val_before_request = g_factor;
	g_factor = clamp(val_before_request+delta, 0, g_ceiling);
	if (g_factor != val_before_request) {
		return true;	
	} else {
		return false;	
	}
}

modify_b_factor = function(delta) {
	var val_before_request = b_factor;
	b_factor = clamp(val_before_request+delta, 0, b_ceiling);
	if (b_factor != val_before_request) {
		return true;	
	} else {
		return false;	
	}
}

resetDiceModifiers = function() {
	r_dice_modifier = 0;
	g_dice_modifier = 0;
	b_dice_modifier = 0;
}

doomed = function() {
	var result = false;
	for(var i=0;i<array_length(effects);i++) {
			if effects[i].object_index == obj_eff_doom {
				result = true;
			}
		}
	return result;
}

toggleDecision = function() {
	if decision = "L" {
		decision = "R";	
	} else {
		decision = "L";	
	}
}

totalThreat = function() {
	var total = 0;
	for(var i=0;i<array_length(bodyparts);i++) {
		var bp = bodyparts[i];
		if bp.isChecked() && bp.hp == 1 { // or the attack is Brutal, i suppose
			total += bp.blood_value;
		}
	}
	return total;
}

// note, this does not reflect "heart points"
// but rather "hit points" from all BPs. It is a read-only 
// value useful primarily for knowing whether
// heals or damage effects have gone off, by
// checking its value over time.
hp_total = function() {
	var total = 0;
	for (var i=0;i<array_length(bodyparts);i++) {
		if instance_exists(bodyparts[i]) {
			total += bodyparts[i].hp;	
		}
	}
	return total;
}