/// @description Insert description here
// You can write your code in this editor
if accepts_input {
	if keyboard_check(vk_right) {
		if place_free(x+16, y) {
			sprite_index = spr_player_walkright;
			direction = 0;
			kickoffAnimation();
		}
	} else if keyboard_check(vk_up) {
		if place_free(x, y-16) {
			sprite_index = spr_player_walkup;
			direction = 90;
			kickoffAnimation();
		}
	} else if keyboard_check(vk_left) {
		if place_free(x-16, y) {
			walkLeft();
		}
	} else if keyboard_check(vk_down) {
		if place_free(x, y+16) {
			sprite_index = spr_player_walkdown;
			direction = 270;
			kickoffAnimation();
		}
	} else {
	}
} else {
	
}

function kickoffAnimation() {
	accepts_input = false;
	image_speed = 1;
	speed = 2;
	alarm[0] = 8;
}

function walkLeft() {
	sprite_index = spr_player_walkleft;
	direction = 180;
	kickoffAnimation();
}