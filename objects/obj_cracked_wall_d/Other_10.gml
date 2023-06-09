/// @description Insert description here
// You can write your code in this editor

show_debug_message("clicked crack d")
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
			var zombie_attack_dialog = instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
				{
					pages: ["The stone crumbles...","A rotting corpse\nlurches out!"],
					choices: ["FIGHT!"]
				}
			)
			zombie_attack_dialog.callback = function(choice) {
				if (choice == 0) {
					global.duel_parameters = {
						fight_room: room,
						enemy_duelist: "ZOMBIE",
						victoryHandler: victoryHandler
					};
					room_goto(Duel);
				} else {
					show_debug_message("Got unexpected choice in zombie attack: "+string(choice));
				}
			}
		} else if (choice == 1) {
			instance_destroy(shovel_active_dialog);
		} else {
			show_debug_message("Got unexpected choice in crack_d: "+string(choice));
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
} else if (!unrevealed) {
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["Gross."],
			choices: []
		}
	);
} else {
	
}

