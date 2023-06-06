/// @description Insert description here
// You can write your code in this editor
discovered = true; // but will be false when puzzle implemented!
dialog_active = false;
blood_demon = self;

victoryHandler = function() {
	show_debug_message("Triggered the victory callback for the Murderer fight");
	blood_demon.sprite_index = spr_debug_duck;
	instance_create_layer(x,y,"BGInstances", obj_rabbithole);
	instance_destroy(self);
}