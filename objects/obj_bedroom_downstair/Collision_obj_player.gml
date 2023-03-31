/// @description Insert description here
// You can write your code in this editor
if live {
	instance_create_layer(0, 112, "Overlay", obj_btm_dialog_box,
	{
		texts: [
			"It's late...\nbetter get to bed."
		]
	}
);
live = false;
}
