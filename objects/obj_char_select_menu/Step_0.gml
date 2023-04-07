/// @description Insert description here
// You can write your code in this editor


if (ready) {
	if keyboard_check(vk_right) {
		readyTimer();
		cursor = clamp(cursor+1, 0, array_length(items)-1);
		}
	else if keyboard_check(vk_up) {
		readyTimer();
		cursor = clamp(cursor-1, 0, array_length(items));
		}
	else if keyboard_check(vk_left) {
		readyTimer();
		cursor = clamp(cursor-1, 0, array_length(items));
		}
	else if keyboard_check(vk_down) {
		readyTimer();
		cursor = clamp(cursor+1, 0, array_length(items)-1);
		}
	else if keyboard_check(ord("Z")) {
		obj_player.dreamform = items[cursor];
		instance_destroy(self);
		}
}