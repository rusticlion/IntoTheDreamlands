/// @description Insert description here
show_debug_message("clicked pip[e b")
if (dialog_active) {
	dialog_active = false;	
} else if (obj_player.equipped_item == "WRENCH") {
	dialog_active = true;
	wrench_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["You can see water\nflowing fast. There\nis a small leak."],
			choices: ["USE WRENCH", "JUST LOOK"]
		}
	);
	wrench_active_dialog.callback = function(choice) {
		if (choice == 0) {
			sprite_index = spr_debug_duck;
			open = true;
			instance_destroy(wrench_active_dialog);
		} else if (choice == 1) {
			instance_destroy(wrench_active_dialog);
		} else {
			show_debug_message("Got unexpected choice in wall_pipe_b: "+string(choice));
		}
	}
} else {
	dialog_active = false;
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["You can see water\nflowing fast. There\nis a small leak."],
			choices: []
		}
	);
}

