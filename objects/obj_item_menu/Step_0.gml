/// @description Insert description here
// You can write your code in this editor
if keyboard_check_released(vk_up) {
	cursor = clamp(cursor-1, 0, array_length(global.items)-1);
	if (cursor < top_frame) {
		top_frame--;
	}
} else if (keyboard_check_released(vk_down)) {
	cursor = clamp(cursor+1, 0, array_length(global.items)-1);
	top_frame = clamp(
		(cursor-6),
		0,
		array_length(global.items)<7 ? 0 : array_length(global.items)-7
	);
	show_debug_message(top_frame);
} else if (keyboard_check_released(ord("Z"))) {
	obj_player.equipped_item = global.items[cursor];
	show_debug_message("cursor: "+string(cursor)+" frame: "+string(top_frame))
} else if (keyboard_check_released(ord("Q"))&&done_building) {
	obj_player.unlock();
	instance_destroy();
}