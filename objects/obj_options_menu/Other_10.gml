/// @description Insert description here
// You can write your code in this editor
for (var i=0;i<array_length(options);i++) {
	var upper_bound = yOffset()+i*global.tile_size+global.tile_size;
	var lower_bound = yOffset()+i*global.tile_size+2*global.tile_size;
	show_debug_message(upper_bound);
	show_debug_message(obj_mouse_cursor.y);
	if (obj_mouse_cursor.y >= upper_bound && obj_mouse_cursor.y < lower_bound) {
		options[i].callback();
	}
}