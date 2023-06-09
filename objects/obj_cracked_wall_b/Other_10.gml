/// @description Insert description here
// You can write your code in this editor
show_debug_message("clicked crack b")
if (dialog_active) {
	dialog_active = false;
} else if (obj_player.equipped_item == noone) {
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The stone is loose\nhere."],
			choices: []
		}
	);
} else if (obj_player.equipped_item.object_index == obj_item002_shovel) {
	shovel_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The stone is loose\nhere.\nUse SHOVEL?"],
			choices: ["DIG", "NOT NOW"]
		}
	);
	shovel_active_dialog.callback = function(choice) {
		if (choice == 0) {
			image_index = 1;
			instance_destroy(shovel_active_dialog);
			unrevealed = false;
			var bonedemon_attack_dialog = instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
				{
					pages: ["The stone crumbles...","A shade of crumbling\nbone lurches out!"],
					choices: ["FIGHT!"]
				}
			)
			bonedemon_attack_dialog.callback = function(choice) {
				if (choice == 0) {
					global.duel_parameters = {
						fight_room: room,
						enemy_duelist: "BONE DEMON",
						victoryHandler: victoryHandler
					};
					room_goto(Duel);
				} else {
					show_debug_message("Got unexpected choice in demon attack: "+string(choice));
				}
			}
		} else if (choice == 1) {
			instance_destroy(shovel_active_dialog);
		} else {
			show_debug_message("Got unexpected choice in crack_b: "+string(choice));
		}
	}
} else if (unrevealed) {
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The stone is loose\nhere."],
			choices: []
		}
	);
} else {
	
}

