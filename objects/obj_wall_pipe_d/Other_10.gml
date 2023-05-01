/// @description Insert description here
show_debug_message("clicked pipe d")
if (dialog_active) {
	dialog_active = false;	
} else if (shovel_present) {
	dialog_active = true;
	shovel_discovery_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["You can see water\nflowing fast. Hey,\nthere's something","under the pipe!"],
			choices: ["TAKE IT", "JUST LOOK"]
		}
	);
	shovel_discovery_dialog.choiceHandler = function(choice) {
		if (choice == 0) {
			sprite_index = spr_wall_pipe_porthole;
			shovel_present = false;
			// add shovel to inventory
			instance_destroy(shovel_discovery_dialog);
		} else if (choice == 1) {
			instance_destroy(shovel_discovery_dialog);
		} else {
			show_debug_message("Got unexpected choice in wall_pipe_b: "+string(choice));
		}
	}
} else {
	dialog_active = true;
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["You can see water\nflowing fast."],
			choices: []
		}
	);
}

