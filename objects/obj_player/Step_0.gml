/// @description Insert description here
// You can write your code in this editor
if (moving) {
	if keyboard_check(vk_right) {
		if (sprite_index == right_sprite) {
			addMomentum();
		} else  {
			momentum = 0; 
		}
	} else if keyboard_check(vk_up) {
		if (sprite_index == up_sprite) {
			addMomentum();
		} else  {
			momentum = 0; 
		}
	} else if keyboard_check(vk_left) {
		if (sprite_index == left_sprite) {
			addMomentum();
		} else  {
			momentum = 0; 
		}
	} else if keyboard_check(vk_down) {
		if (sprite_index == down_sprite) {
			addMomentum();
		} else  {
			momentum = 0; 
		}
	} else {
		momentum = 0;
	}
} else {
	if keyboard_check(vk_right) {
		sprite_index = right_sprite;
		direction = 0;
		updateFacingCoordinates();
		addMomentum();
	} else if keyboard_check(vk_up) {
		sprite_index = up_sprite;
		direction = 90;
		updateFacingCoordinates();
		addMomentum();
	} else if keyboard_check(vk_left) {
		sprite_index = left_sprite;
		direction = 180;
		updateFacingCoordinates();
		addMomentum();
	} else if keyboard_check(vk_down) {
		sprite_index = down_sprite;
		direction = 270;
		updateFacingCoordinates();
		addMomentum();
	} else {
		momentum = 0;
	}
	
}

addMomentum = function() {
	momentum = clamp(momentum+1,0,3);
}

updateFacingCoordinates = function() {
	switch(sprite_index) {
		case right_sprite:
			facing_tile_x = x+16;
			facing_tile_y = y;
		break;
		case down_sprite:
			facing_tile_x = x;
			facing_tile_y = y+16;
		break;
		case left_sprite:
			facing_tile_x = x-16;
			facing_tile_y = y;
		break;
		case up_sprite:
			facing_tile_x = x;
			facing_tile_y = y-16;
		break;
		default:
		
		break;
	}
}
updateFacingCoordinates();

if (momentum>2 && readyToMove() && facingIsClear()){
	moveOneTile();
}

facingIsClear = function() {
	return place_free(facing_tile_x, facing_tile_y);
}

moveOneTile = function() {
	moving = true;
	image_speed = 1;
	speed = 2;
	alarm[0] = 8;
}

readyToMove = function() {
	if moving == false {
		return true;
	} else {
		return false;	
	}
}
