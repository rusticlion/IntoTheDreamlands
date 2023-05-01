/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
draw_set_font(KenneyMini)

menu_length = 7;
if array_length(global.items) < 7 {
		menu_length = array_length(global.items);
}
for(var i=0;i<menu_length;i++){
	var this_item = global.items[i+top_frame];
	draw_rectangle_color(
		0,
		y+global.tile_size*(i+1),
		7*global.tile_size,
		y+(global.tile_size*(i))+1,
		c_white, c_white, c_white, c_white,
		false
	);
	item_text = this_item;
	if (this_item == obj_player.equipped_item) {
		item_text = "*"+item_text;	
	}
	if (cursor==i+top_frame) {
		item_text = ">"+item_text;
	}
	draw_text(1, y+global.tile_size*i, item_text);
}