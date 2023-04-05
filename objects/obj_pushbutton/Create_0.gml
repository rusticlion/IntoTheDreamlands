/// @description Insert description here
// You can write your code in this editor
event_inherited();
state = "READY";
hover_text = "Convert factor to dice.\nCosts no energy"
image_speed = 0;
pushbuttonEffect = function() {
	obj_debug_duck.visible = true;
	obj_debug_duck.debugMessage = "Bad Pushbutton";
}

reset = function() {
	sprite_index = spr_big_pushbutton;
}