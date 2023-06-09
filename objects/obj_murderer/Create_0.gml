/// @description Insert description here
// You can write your code in this editor
unrevealed = true;
dialog_active = false;
murderer = self;

victoryHandler = function() {
	show_debug_message("Triggered the victory callback for the Murderer fight");
	murderer.sprite_index = spr_debug_duck;
	obj_demon_basement_manager.openDoorRabbithole();
}

murdererAttacks = function() {
	unrevealed = false;
	murderer_active_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["The murderer attacks!"],
			choices: ["FIGHT!"]
		}
	);
	murderer_active_dialog.callback = function(choice) {
		if (choice == 0) {
			global.duel_parameters = {
				enemy_duelist: "MURDERER",
				victoryHandler: victoryHandler
			};
			combat_manager = instance_create_layer(0,0,"Overlay", obj_combat);
			combat_manager.startCombat();
		} else {
			show_debug_message("Got unexpected choice in murderer attack: "+string(choice));
		}
	}
}