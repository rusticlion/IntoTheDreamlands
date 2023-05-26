/// @description Insert description here
// You can write your code in this editor
unrevealed = true;
dialog_active = false;
cracked_wall = self;

victoryHandler = function() {
	show_debug_message("Triggered the victory callback for the Zombie fight");
	cracked_wall.image_index = 2;
}