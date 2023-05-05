/// @description Dye based on HP

if hp == 1 {
	image_blend = c_yellow;
} else if hp == 0 {
	image_blend = c_red;	
}

draw_self();