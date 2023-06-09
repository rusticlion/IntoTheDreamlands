/// @description Insert description here
// You can write your code in this editor

show_debug_message("clicked murderer")
if (dialog_active) {
	dialog_active = false;
} else if (unrevealed) {
	murdererAttacks();
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

