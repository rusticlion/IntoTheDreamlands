/// @description Insert description here
// You can write your code in this editor
if keyboard_check_released(vk_up) {
	bodypart_cursor = clamp(bodypart_cursor-1, 0, 5);
	placeSelectedCardInSlots();
} else if (keyboard_check_released(vk_down)) {
	bodypart_cursor = clamp(bodypart_cursor+1, 0, 5);
	placeSelectedCardInSlots();
}