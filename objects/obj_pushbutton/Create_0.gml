/// @description Insert description here
// You can write your code in this editor
event_inherited();
state = "READY";
hover_text = "Converts Factor to dice as often as you want."
image_speed = 0;
pushbuttonEffect = function() {
	obj_debug_duck.visible = true;
	obj_debug_duck.debugMessage = "Bad Pushbutton";
}

reset = function() {
	sprite_index = spr_big_pushbutton;
}