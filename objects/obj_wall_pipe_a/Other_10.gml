/// @description Insert description here
// You can write your code in this editor
if (dialog_active) {
	dialog_active = false;	
} else {
	dialog_active = false;
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: ["You can see water\nflowing fast."],
			choices: []
		}
	);
}
