/// @description Insert description here
// You can write your code in this editor
draw_self();
for (var i=0;i<array_length(bodyparts);i++) {
	bp = bodyparts[i];
	//draw_sprite(bp.sprite_index, bp.image_index, x_offset+(13*global.tile_size)+2, y_offset+(i*global.tile_size)+2)	
}

draw_sprite(spr_letter_arrow, 0, selectedBodypart().x-global.tile_size, selectedBodypart().y)