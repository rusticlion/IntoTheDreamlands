/// @description Insert description here
// You can write your code in this editor
/*
if holding = "empty" {
	target = instance_nearest(x, y, obj_clickable);
} else {
	target = instance_nearest(x, y, obj_slot);
}
*/
target = instance_nearest(x, y, obj_clickable);
show_debug_message("Click target: "+string(target));

if (target != noone && target.locked == false) {
	show_debug_message("target is valid!");
	if instance_position(x, y, target) {
		show_debug_message("target collides with cursor");
		with (target) {
			event_user(0); //click callback
		}
	} else if (target.x == x && target.y == y) {
		show_debug_message("target coincides with cursor");
		with (target) {
			event_user(0); //click callback
		}
	} else {
		show_debug_message("no collision with target "+string(target.x)+","+string(target.y))
		show_debug_message("from mouse position "+string(x)+","+string(y))
	}
}

