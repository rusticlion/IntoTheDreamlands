/// @description Insert description here
// You can write your code in this editor

show_debug_message("clicked blood demon")
if (dialog_active) {
	dialog_active = false;
} else if (!discovered){
	// nothing!
} else if (discovered) {
	demon_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The monster attacks!"],
			choices: ["FIGHT!"]
		}
	);
	demon_active_dialog.callback = function(choice) {
		if (choice == 0) {
			global.duel_parameters = {
				fight_room: room,
				enemy_duelist: "BLOOD DEMON",
				victoryHandler: victoryHandler
			};
			room_goto(Duel);
		} else {
			show_debug_message("Got unexpected choice in blood demon attack: "+string(choice));
		}
	}
} else {
	
}

