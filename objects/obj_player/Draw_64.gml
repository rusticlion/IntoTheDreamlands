/// @description Overlay character elements
// You can write your code in this editor
if !instance_exists(obj_pause_menu) {
	var item_sprite = spr_empty;
	if equipped_item != noone {
		item_sprite = equipped_item.sprite_index;	
	}
	draw_sprite(item_sprite, 0, 14*global.tile_size, 0);
	draw_sprite(spr_bracket, 0, 14*global.tile_size, 0);
}