/// @description Insert description here
// You can write your code in this editor
x_origin = x;
y_origin = y;

cursor = 0;

character_list = [
	spr_player_walkdown,
	spr_player_2_walkdown
]

cursorForward = function() {
	cursor += 1;
	if (cursor >= array_length(character_list)) {
		cursor = 0;
	}
}

cursorBack = function() {
	cursor -= 1
	if (cursor < 0) {
		cursor = array_length(character_list)-1;	
	}
}