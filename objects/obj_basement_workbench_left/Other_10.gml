/// @description Insert description here
show_debug_message("clicked left table");
if (dialog_active) {
	dialog_active = false;	
} else if (!obj_player.moving && cutters_present) {
	opened = true;
	image_index = 1;
	image_speed = 0;
	cutters_discovery_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["Stained implements and stainless steel.","The compartment is unlocked. There's a pair of bolt cutters inside."],
			choices: ["TAKE IT", "LEAVE IT"]
		}
	);
	cutters_discovery_dialog.callback = function(choice) {
		if (choice == 0) {
			cutters_present = false;
			obj_player.gainItem(obj_item007_bolt_cutters); //add cutters to inventory
			instance_destroy(cutters_discovery_dialog);
		} else if (choice == 1) {
			instance_destroy(cutters_discovery_dialog);
		} else {
			show_debug_message("Got unexpected choice in left bloody desk: "+string(choice));
		}
	}
} else if (!cutters_present) {
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["Stained implements and stainless steel.","Nothing else in the compartment."],
			choices: []
		}
	);
}

