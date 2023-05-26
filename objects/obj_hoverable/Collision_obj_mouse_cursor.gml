/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_dm) {
	if obj_mouse_cursor.holding == noone {
		obj_dm.dialog.text = hover_text;
	}
} else if instance_exists(obj_menu_dialog) {
	obj_menu_dialog.text = hover_text;
}

