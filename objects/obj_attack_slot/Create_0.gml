/// @description Insert description here
// You can write your code in this editor
contains = noone;
power_score = 0;
splendor_active = false;

apply = function(die) {
	if (contains != noone && die.image_blend != c_red) {
		return false; // If filled, reject all except Red
	}
	if (die.object_index == obj_blk_die && splendor_active) {
		return false; // Splendor grants immunity to black dice
	}
	if (die.object_index == obj_white_die || die.image_blend == c_green) {
		return false; // Reject all except Red, Blue, and Black
	}
	die.x = x+2;
	die.y = y+2;
	
	if (contains != noone) {
		instance_destroy(contains);	
	}
	contains = die;
	
	die.lock();
	
	updated_power_score = power_score + die.shows;
	power_score = updated_power_score;
	die.updateValue(power_score);
	return true;
}

reset = function() {
	power_score = 0;
	contains = noone;
}

activateSplendor = function() {
	sprite_index = spr_splendor_attack_die_slot;
	splendor_active = true;
}

deactivateSplendor = function() {
	sprite_index = spr_attack_die_slot;
	splendor_active = false;
}