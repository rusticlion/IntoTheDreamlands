/// @description Insert description here
// You can write your code in this editor
menu_selection = "NEW GAME";
ready = true;

title_text_l1 = "INTO THE";
title_text_l2 = "DREAM LANDS"

letter_drawing(0*global.tile_size, 2*global.tile_size, title_text_l1);
letter_drawing(2*global.tile_size, 4*global.tile_size, title_text_l2);

readyTimer = function() {
	show_debug_message("counting off five frames");
	ready = false;
	alarm[0] = 5;
}

menuForward = function() {
	switch(menu_selection) {
		case "NEW GAME":
			menu_selection = "LOAD";
		break;
		case "LOAD":
			menu_selection = "SETTINGS";
		break;
		case "SETTINGS":
			menu_selection = "NEW GAME";
		break;
		default:
			menu_selection = "NEW GAME";
		break;
	}
}

menuBack = function() {
	switch(menu_selection) {
		case "NEW GAME":
			menu_selection = "SETTINGS";
		break;
		case "LOAD":
			menu_selection = "NEW GAME";
		break;
		case "SETTINGS":
			menu_selection = "LOAD";
		break;
		default:
			menu_selection = "NEW GAME";
		break;
	}
}