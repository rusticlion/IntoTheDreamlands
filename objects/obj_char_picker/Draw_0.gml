/// @description Insert description here
// You can write your code in this editor
for(var i=0;i<array_length(character_list);i++) {
	draw_sprite(character_list[i], image_index, x_origin+global.tile_size*i*2, y_origin);
	if cursor == i {
		draw_sprite(spr_kb_cursor, image_index, x_origin+global.tile_size*i*2, y_origin);
	}
}