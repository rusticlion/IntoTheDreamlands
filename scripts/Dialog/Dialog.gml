// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Dialog(){

}

function buildDialog(pages=["An example dialog."], choices=[],callback=function(){},portrait=noone) {
	if (obj_game.dialog_active == false) {
		obj_game.dialog_active = true;
		var dialog = instance_create_layer(
			0,0,"Overlay",
			obj_dialog,
			{
				pages: pages,
				choices: choices
			}
		);
		dialog.callback = callback;
		dialog.portrait = portrait;
		return dialog;
	} else {
		show_debug_message("Tried to build a dialog while another was still open.");	
	}
}
