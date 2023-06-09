/// @description Insert description here
// You can write your code in this editor
show_debug_message("Stood on a Permeable Actor (Spooky Spot)");
if (dialog_active) {
	
} else if (obj_player.hasEquipped(obj_item003_devils_brush) && state == "NOT_REVEALED") {
	// More complicated requirements later
	// Gotta decide how item metadata persistence will work
	state = "REVEALED";
	
} else {
	dialog_active = true;
	var pages_to_show = ["Standing here gives you the heebie-jeebies."];
	var choiceHandler = function(choice) {
				switch(choice) {
					case 0:
						obj_player.unlock();
						obj_player.moveOneTile();
						alarm[0] = 16;
					break;
					default:
					break;
				}
			}
	spooky_spot_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: pages_to_show,
			choices: ["LEAVE"]
		}
	);
	spooky_spot_dialog.callback = choiceHandler;
}