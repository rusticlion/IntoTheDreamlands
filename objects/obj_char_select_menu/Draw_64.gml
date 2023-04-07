/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);

// this should draw on whichever half of the screen
// the player does not occupy
draw_rectangle(0,0*global.tile_size,7*global.tile_size, 10*global.tile_size, false);

draw_set_color(c_black);
draw_set_font(KenneyMini);

for(var i=0;i<array_length(items);i++) {
	var text = items[i];
	if (cursor == i) {
		text = ">"+text;	
	}
	draw_text(1, i*global.tile_size, text);
}