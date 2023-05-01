/// @description Insert description here
// You can write your code in this editor
target = noone;
switch(sprite_index) {
	case right_sprite:
		target = instance_place(x+1*global.tile_size, y, obj_actor);
	break;
	case down_sprite:
		target = instance_place(x, y+1*global.tile_size, obj_actor);
	break;
	case left_sprite:
		target = instance_place(x-1*global.tile_size, y, obj_actor);
	break;
	case up_sprite:
		target = instance_place(x, y-1*global.tile_size, obj_actor);
	break;
	default:
	break;
}

if (target != noone) {
	with (target) {
		event_user(0);
	}
}