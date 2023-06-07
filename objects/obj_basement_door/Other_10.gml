/// @description Insert description here
// You can write your code in this editor
show_debug_message("clicked basement door")

if (dialog_active) {
	show_debug_message("dialog is active already, deactivate");
	dialog_active = false;
} else {
	switch(state) {
		case "LOCKED":
			if (obj_player.hasEquipped(obj_item005_key)) {
				key_active_dialog = instance_create_layer(
					0,0,"Overlay",
					obj_dialog,
					{
						pages: ["It's locked.\nUse KEY?"],
						choices: ["YES", "NO"]
					}
				);
				key_active_dialog.choiceHandler = function(choice) {
					if (choice == 0) {
						state = valid_states[1];
						image_index = 1;
						solid = false;
						instance_destroy(key_active_dialog);
						instance_create_layer(
							0,0,"Overlay",
							obj_dialog,
							{
								pages: ["The door swings open...","What was that sound?!"],
								choices: []
							}
						)
						murderer = instance_create_layer(x,y+global.tile_size*2,"BGInstances",obj_murderer);
					} else if (choice == 1) {
						instance_destroy(key_active_dialog);
					} else {
						show_debug_message("Got unexpected choice in basement door: "+string(choice));
					}
				}
			} else {
				instance_create_layer(
					0,0,"Overlay",
					obj_dialog,
					{
						pages: ["It's locked. Seems sturdy."],
						choices: []
					}
				);
			}
		break;
		case "OPEN":
		
		break;
		default:
		break;
	
	}
};
