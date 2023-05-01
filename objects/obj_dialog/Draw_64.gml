/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_black);
draw_set_font(KenneyMini)

draw_text_ext(
	x+global.tile_size*3,
	y,
	string_copy(pages[cursor], 1, typewriterProgress),
	16,
	global.tile_size*12
);

if (show_blinker) {
	draw_text(x+230, y+30, "v");
}
if (show_choices) {
	for(var i=0;i<array_length(choices);i++){
		var this_choice = choices[i];
		draw_rectangle_color(
			9*global.tile_size,
			y+global.tile_size*(i-2),
			15*global.tile_size,
			y+(global.tile_size*(i-3))+1,
			c_white, c_white, c_white, c_white,
			false
		);
		choice_text = (choice_cursor==i) ? ">"+this_choice : this_choice;
		draw_text(9*global.tile_size+1, y+global.tile_size*(i-3), choice_text);
		show_debug_message(choice_text);
	}
}