/// @description Insert description here
// You can write your code in this editor

target = instance_nearest(x, y, obj_clickable);

if (target != noone && target.locked == false) {
	if instance_position(target.x, target.y, self) {
		with (target) {
			event_user(0); //click callback
		}
	}	
}


