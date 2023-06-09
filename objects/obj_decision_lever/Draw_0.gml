/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_dm)) {
	if (owner.decision == "L" && image_index > 0) {
		image_index--;;
	} else if (owner.decision = "R" && image_index < 9) {
		image_index++;	
	}
	draw_self();
} else {
	draw_self();
}