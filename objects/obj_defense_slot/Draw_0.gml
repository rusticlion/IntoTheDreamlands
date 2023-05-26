/// @description Insert description here
// You can write your code in this editor
if (difficulty > 19) {
	image_index = 11;
} else if (difficulty > 9) {
	image_index = 10;
} else {
	image_index = difficulty;
}
draw_self();