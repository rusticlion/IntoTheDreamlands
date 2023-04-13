/// @description Insert description here
// You can write your code in this editor
draw_self();

for(var i=1;i<=string_length(field);i++) {
	draw_sprite(letterToSprite(string_char_at(field, i)), irandom(2), field_x_origin+i*global.tile_size, field_y_origin);
}