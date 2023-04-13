/// @description Insert description here
// You can write your code in this editor
if (ready) {
	if keyboard_check(vk_right) {
		readyTimer();
		menuForward();
	} else if keyboard_check(vk_up) {
		readyTimer();
		menuBack();
	} else if keyboard_check(vk_left) {
		readyTimer();
		menuBack();
	} else if keyboard_check(vk_down) {
		readyTimer();
		menuForward();
	}
}