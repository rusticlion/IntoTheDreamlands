/// @description Insert description here
// You can write your code in this editor
if (active) {
	image_blend = c_blue;
	image_angle += 2;
	if image_angle >= 360 {
		image_angle = 0;
	}
} else {
	image_blend = noone;
}
draw_self();