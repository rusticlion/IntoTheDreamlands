/// @description Insert description here
// You can write your code in this editor
if ((state == "PUSHING") && (image_index < image_number-1)) {
	image_speed = 3;
} else if (image_index >= image_number-1) {
	state = "READY";
	image_index = 0;
	image_speed = 0;
}

draw_self();