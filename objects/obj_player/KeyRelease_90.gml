/// @description Insert description here
// You can write your code in this editor
target = noone;
switch(sprite_index) {
	case spr_player_walkright:
		target = instance_place(x+1*global.tile_size, y, obj_actor);
	break;
	case spr_player_walkdown:
		target = instance_place(x, y+1*global.tile_size, obj_actor);
	break;
	case spr_player_walkleft:
		target = instance_place(x-1*global.tile_size, y, obj_actor);
	break;
	case spr_player_walkup:
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