/// @description Insert description here
show_debug_message("clicked pipe c")
if (dialog_active) {
	show_debug_message("deactivating dialog box");
	dialog_active = false;	
} else if (obj_player.equipped_item == obj_esoterica) {
	show_debug_message("activating esoterica dialog");
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
	show_debug_message("default: showing can't reach msg");
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["Can't really reach this\none..."],
			choices: []
		}
	);
	dialog_active = false; // false because non-choice dialog handles itself
}

