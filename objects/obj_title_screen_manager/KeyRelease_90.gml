/// @description Insert description here
// You can write your code in this editor
if (ready) {
	readyTimer();
	switch(menu_selection) {
		case "NEW GAME":
				obj_new_game_btn.click();
			break;
			case "LOAD":
				obj_load_game_btn.click();
			break;
			case "SETTINGS":
				obj_settings_btn.click();
			break;
			default:
			break;
}
}