/// @description Insert description here
// You can write your code in this editor
cursor = 0;
done_building = false;

obj_player.lock();
show_debug_message("Built pause menu");
alarm[1] = 5;

menu_options = [
	"Dreamform",
	"Metatools",
	"Esoterica",
	"Save",
	"Options",
	"Done"
]


click_dreamform = function() {
	show_debug_message("not implemented!");
}

click_metatools = function() {
	show_debug_message("not implemented!");
}

click_esoterica = function() {
	show_debug_message("not implemented!");
}

click_save = function() {
	Save("player1");
}

click_options = function() {
	show_debug_message("not implemented!");
}

click_done = function() {
	instance_destroy();	
}

menu_callbacks = [
	click_dreamform,
	click_metatools,
	click_esoterica,
	click_save,
	click_options,
	click_done
]
