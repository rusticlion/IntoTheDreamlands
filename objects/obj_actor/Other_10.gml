/// @description Overwrite with actor behavior
// on overworld interaction from player
// by default, provide a dialogue according to config
if (dialog_active) {
	dialog_active = false;
} else {
	actor_dialog = instance_create_layer(
		0,0,"Overlay",
		obj_dialog,
		{
			pages: dialog_pages,
			choices: dialog_choices
		}
	);
	actor_dialog.choiceHandler = choiceHandler;
}

