/// @description Insert description here
// You can write your code in this editor
if (dialog_active) {
	dialog_active = false;	
} else {
	dialog_active = false;
	var pages_to_show = ["Ducts connect the drains in the table to cylinders nearby."];
	instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: pages_to_show,
			choices: []
		}
	);
}
