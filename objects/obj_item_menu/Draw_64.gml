/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_set_font(KenneyMini)
show_debug_message("generating inv for item list: "+string(obj_player.getItems()));
menu_length = clamp(array_length(obj_player.getItems()), 0, 7);

for(var i=0;i<menu_length;i++){
	var this_item = obj_player.getItems()[i+top_frame];
	draw_rectangle_color(
		0,
		y+global.tile_size*(i+1),
		7*global.tile_size,
		y+(global.tile_size*(i))+1,
		c_white, c_white, c_white, c_white,
		false
	);
	item_text = this_item.name;
	if (this_item == obj_player.equipped_item) {
		item_text = "*"+item_text;	
	}
	if (cursor==i+top_frame) {
		item_text = ">"+item_text;
	}
	draw_text(1, y+global.tile_size*i+2, item_text);
}

if menu_length == 0 {
	draw_rectangle_color(
		0,
		y+global.tile_size,
		7*global.tile_size,
		y+1,
		c_white, c_white, c_white, c_white,
		false
	);
	draw_text(1, y+2, "NOTHING...");
}