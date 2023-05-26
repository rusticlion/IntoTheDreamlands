/// @description Insert description here
// You can write your code in this editor
contains = noone;
difficulty = bodypart.toughness;

updated_difficulty = difficulty;


apply = function(die) {
	if (contains != noone && die.image_blend != c_lime) {
		return false; // If filled, reject all except Green
	}
	if (die.object_index == obj_blk_die || die.image_blend == c_red) {
		return false; // If empty, accept White, Green, or Blue
	}
	if (contains != noone) {
		instance_destroy(contains);	
	}
	contains = die;
	
	die.lock();
	die.y = y+1;
	die.x = x+2;
	updated_difficulty = difficulty + die.shows;
	die.updateValue(updated_difficulty);
	difficulty = updated_difficulty;
	return true;
}

reset = function() {
	difficulty = bodypart.toughness
	updated_difficulty = difficulty;
	contains = noone;
}
