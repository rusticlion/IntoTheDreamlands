/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
x_origin = x;
y_origin = y;

if (!variable_instance_exists(self, "color")) {
	color = c_white;	
}

image_blend = color;

sprite_index = letterToSprite(letter);

startFlicker = function() {
	alarm[0] = irandom(30);	
}

startFlicker();