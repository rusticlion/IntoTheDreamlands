/// @description Dye based on HP

if hp == 2 {
	image_blend = noone;
} else if hp == 1 {
	image_blend = c_yellow;
} else if hp == 0 {
	image_blend = c_red;	
}

if instance_exists(obj_dm) {
	if ((is_hovered && obj_dm.phase == "CLAIM_BP") && controller == obj_dm.player2) {
		image_blend = c_fuchsia;
	}
}

draw_self();