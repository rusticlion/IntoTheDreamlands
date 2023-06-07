/// @description Insert description here
// You can write your code in this editor
show_debug_message("clicked crack a")
if (!unrevealed) {
	show_debug_message("do nothing since lifecycle concluded")
} else if (dialog_active) {
	show_debug_message("dialog is active already, deactivate");
	dialog_active = false;
} else if (obj_player.equipped_item == noone) {
	show_debug_message("player has no shovel dialog");
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The stone is loose\nhere."],
			choices: []
		}
	);
} else if (obj_player.equipped_item.object_index == obj_item002_shovel && !obj_player.moving) {
	show_debug_message("player has shovel and is ready dialog");
	shovel_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The stone is loose\nhere.\nUse SHOVEL?"],
			choices: ["DIG", "NOT NOW"]
		}
	);
	shovel_active_dialog.choiceHandler = function(choice) {
		if (choice == 0) {
			image_index = 1;
			solid = false;
			instance_destroy(shovel_active_dialog);
			instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
				{
					pages: ["The stone crumbles to\nreveal a passage!"],
					choices: []
				}
			)
			unrevealed = false;
		} else if (choice == 1) {
			instance_destroy(shovel_active_dialog);
		} else {
			show_debug_message("Got unexpected choice in crack_a: "+string(choice));
		}
	}
} else if (unrevealed) {
	show_debug_message("fallback player has no shovel dialog");
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The stone is loose\nhere."],
			choices: []
		}
	);
} else {
	show_debug_message("do nothing since lifecycle concluded");
}

