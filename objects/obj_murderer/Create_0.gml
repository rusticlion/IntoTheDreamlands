/// @description Insert description here
// You can write your code in this editor
unrevealed = true;
dialog_active = false;
murderer = self;

victoryHandler = function() {
	show_debug_message("Triggered the victory callback for the Murderer fight");
	murderer.sprite_index = spr_debug_duck;
}