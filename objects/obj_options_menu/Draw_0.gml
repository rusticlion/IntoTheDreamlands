/// @description Insert description here
// You can write your code in this editor
draw_self();

for (var i=0;i<array_length(options);i++) {
	draw_set_font(KenneyMini);
	draw_set_color(c_white);
	draw_text(xOffset()+4+global.tile_size, yOffset()+global.tile_size*(1+i)+4, options[i].option_text);
	
	var upper_bound = yOffset()+i*global.tile_size+global.tile_size;
	var left_bound = xOffset();
	var o = options[i];
	var enabled = o.getState();
	if enabled {
		draw_sprite(spr_option_box, 0, left_bound, upper_bound);
	} else {
		draw_sprite(spr_option_box, 1, left_bound, upper_bound);
	}
}