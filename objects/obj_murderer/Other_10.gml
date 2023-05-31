/// @description Insert description here
// You can write your code in this editor

show_debug_message("clicked murderer")
if (dialog_active) {
	dialog_active = false;
} else if (unrevealed) {
	murderer_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The murderer attacks!"],
			choices: ["FIGHT!"]
		}
	);
	murderer_active_dialog.choiceHandler = function(choice) {
		if (choice == 0) {
			global.duel_parameters = {
				fight_room: room,
				enemy_duelist: "MURDERER",
				victoryHandler: victoryHandler
			};
			room_goto(Duel);
		} else {
			show_debug_message("Got unexpected choice in murderer attack: "+string(choice));
		}
	}
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

