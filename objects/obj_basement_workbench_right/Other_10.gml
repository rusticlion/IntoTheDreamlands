/// @description Insert description here
show_debug_message("clicked left table");
if (dialog_active) {
	dialog_active = false;
} else if (obj_player.moving) {
	// do nothing
} else {
	switch(state) {
		case "LOCKED":
			if (obj_player.hasEquipped(obj_item007_bolt_cutters)) {
				cut_chain_dialog = instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
					{
						pages: ["The compartment is locked by a continuous loop of chain.","Use your BOLT CUTTERS?"],
						choices: ["CUT", "NOT NOW"]
					}
				);
				cut_chain_dialog.choiceHandler = function(choice) {
					switch(choice) {
						case 0:
							state = valid_states[1];
							image_index = 1;
							image_speed = 0;
							obj_player.removeItem(obj_item007_bolt_cutters);
							instance_create_layer(
							0,0,"Overlay",
							obj_dialog,
							{
								pages: ["The stubborn chain gives way, but the rusted cutters snap and break as it does."],
								choices: []
							}
							)
						break;
						case 1:
							// nothing
						break;
						default:
						break;
			
					}
					instance_destroy(cut_chain_dialog);
				}
			} else if (obj_player.hasItem(obj_item007_bolt_cutters)){
				instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
					{
						pages: ["The compartment is locked by a continuous loop of chain.","You could try the cutters, though they are in pretty bad shape."],
						choices: []
					}
				);
			} else {
				instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
					{
						pages: ["The compartment is locked by a continuous loop of chain.","There's no obvious way to undo it."],
						choices: []
					}
				);
			}
		break;
		case "OPEN":
			key_discovery_dialog = instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
				{
					pages: ["There's a key inside!"],
					choices: ["TAKE IT", "LEAVE IT"]
				}
			);
			key_discovery_dialog.choiceHandler = function(choice) {
				if (choice == 0) {
					state = valid_states[2];
					obj_player.gainItem(obj_item005_key); //add key to inventory
					instance_destroy(key_discovery_dialog);
				} else if (choice == 1) {
					instance_destroy(key_discovery_dialog);
				} else {
					show_debug_message("Got unexpected choice in right bloody desk: "+string(choice));
				}
			}
		
		break;
		case "LOOTED":
			instance_create_layer(
				0,0,"Overlay",
				obj_dialog,
				{
					pages: ["The compartment is open now. Maybe the key will fit the door."],
					choices: []
				}
			);
		break;
		default:
		break;
	}
	
} 
