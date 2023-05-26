/// @description Insert description here
// You can write your code in this edito
upper_bound = yOffset();
lower_bound = yOffset()+global.tile_size*10;
left_bound = xOffset();
right_bound = xOffset()+global.tile_size*14;

if (global.mouse_enabled) {
	// mouse control
	x = clamp(mouse_x, left_bound, right_bound);
	y = clamp(mouse_y, upper_bound, lower_bound);
} else {
	// arrow key control
	if (ready) {
		if keyboard_check(vk_right) {
			readyTimer();
			x = clamp(x + global.tile_size, left_bound, right_bound);
			}
		else if keyboard_check(vk_up) {
			readyTimer();
			y = clamp(y - global.tile_size, upper_bound, lower_bound);
			}
		else if keyboard_check(vk_left) {
			readyTimer();
			x = clamp(x - global.tile_size, left_bound, right_bound);
			}
		else if keyboard_check(vk_down) {
			readyTimer();
			y = clamp(y + global.tile_size, upper_bound, lower_bound);
			}
		else {
			}
	}
}

// show_debug_message(string(x)+" "+string(y));

if (holding != noone) {
	holding.x = x;
	holding.y = y;
}

if place_empty(x,y,obj_hoverable) {
	setDefaultHovertext();
}