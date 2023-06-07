/// @description Locks while acting
// You can write your code in this editor
if (momentum < 2 || !facingIsClear()) {
	
	moving = false;
	speed = 0
	image_speed = 0
	image_index = 0
	momentum = 0;
	stops();
} else {
	alarm[0] = 8;
	walks();
}