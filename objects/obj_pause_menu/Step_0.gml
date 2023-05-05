/// @description Insert description here
// You can write your code in this editor
if keyboard_check_released(vk_up) {
	cursor = clamp(cursor-1, 0, 5);
} else if (keyboard_check_released(vk_down)) {
	cursor = clamp(cursor+1, 0, 5);
} else if (keyboard_check_released(ord("Z"))) {
	click = menu_callbacks[cursor];
	click();
} else if (keyboard_check_released(vk_enter)&&done_building) {
	obj_player.unlock();
	instance_destroy();
}