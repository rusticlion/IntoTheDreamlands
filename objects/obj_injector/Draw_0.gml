/// @description Insert description here
// You can write your code in this editor
if ((state == "PUSHED") && (image_index != image_number-1)) {
	image_speed = 3;
} else if (image_index >= image_number-1) {
	state = "LOCKED";
	image_speed = 0;
}

draw_self();