/// @description Insert description here
// You can write your code in this editor
event_inherited();
state = "UNPUSHED";
hover_text = "Injectors work once per turn."
image_speed = 0;

injectorEffect = function() {
	show_debug_message("Bad Injector "+string(self.instance_id));
}

reset = function() {
	state = "UNPUSHED";
	image_index = 0;
}