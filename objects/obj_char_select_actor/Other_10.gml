/// @description Insert description here
// You can write your code in this editor

if (!instance_exists(obj_char_select_menu) && ready) {
	instance_create_layer(0,0,"Overlay", obj_char_select_menu);
	obj_player.lock();
}