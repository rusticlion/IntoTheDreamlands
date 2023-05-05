/// @description Insert description here
show_debug_message("clicked pipe c")
if (dialog_active) {
	dialog_active = false;	
} else if (obj_player.equipped_item == obj_esoterica) {
	dialog_active = true;
	esoterica_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["Can't really reach this\none...","a conspicuous NOTHING."],
			choices: []
		}
	);
} else {
	dialog_active = true;
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["Can't really reach this\none..."],
			choices: []
		}
	);
}

