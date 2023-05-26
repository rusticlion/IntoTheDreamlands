/// @description Insert description here
// You can write your code in this editor

mouse_cursor = instance_create_layer(xOffset(), yOffset(), "MenuOverlay", obj_mouse_cursor);
dialog_box = instance_create_layer(xOffset()+global.tile_size*3+6, yOffset()+global.tile_size*6+8, "MenuOverlay", obj_menu_dialog);
equipped_gadgets = obj_player.equipped_gadgets;
unlocked_gadgets = obj_player.unlocked_gadgets;
instances_shown = [];

for (var i=0; i < array_length(unlocked_gadgets); i++) {
	var g = unlocked_gadgets[i];
	var g_instance = instance_create_layer(g.xx+xOffset(), g.yy+yOffset(), "MenuOverlay", global.gadget_index[g.gadget_index]);
	array_push(instances_shown, g_instance);
	show_debug_message("gadget at "+string(g.xx+xOffset())+" "+string(g.yy+yOffset()));
}

closeMenu = function() {
	instance_destroy(obj_menu_dialog);
	instance_destroy(obj_mouse_cursor);
	obj_player.equipped_gadgets = [];
	obj_player.unlocked_gadgets = [];
	for (var i=0;i<array_length(instances_shown);i++) {
		var g = instances_shown[i];
		var mini_g = {
			xx: g.x-xOffset(),
			yy: g.y-yOffset(),
			gadget_index: array_get_index(global.gadget_index, g.object_index)
		}
		show_debug_message(mini_g);
		if (g.x<5*global.tile_size+xOffset() && g.y<6*global.tile_size+yOffset()) {
			array_push(obj_player.equipped_gadgets, mini_g);
		}
		array_push(obj_player.unlocked_gadgets, mini_g);
		instance_destroy(g);	
	}
	obj_pause_menu.unlock();
	instance_destroy();	
}