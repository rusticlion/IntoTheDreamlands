/// @description Insert description here
// You can write your code in this editor
dialog_active = false;
dummy = self;
lesson_complete = false;

victoryHandler = function() {
	show_debug_message("Triggered the victory callback for the Dummy fight");
	lesson_complete = true;
	dummy.sprite_index = spr_debug_duck;
}