/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_set_font(KenneyMini)
menu_length = 6;

for(var i=0;i<menu_length;i++){
	var option_text = menu_options[i];
	draw_rectangle_color(
		global.tile_size*8,
		y+global.tile_size*(i+1),
		15*global.tile_size,
		y+(global.tile_size*(i))+1,
		c_white, c_white, c_white, c_white,
		false
	);
	
	if (cursor==i) {
		option_text = ">"+option_text;
	}
	draw_text(x+global.tile_size*8+1, y+global.tile_size*i+2, option_text);
}
