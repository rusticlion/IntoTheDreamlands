/// @description Insert description here
// You can write your code in this editor
idle = spr_cat_idle;
right = spr_cat_walk_right;
down = spr_cat_walk_down;
left = spr_cat_walk_left;
up = spr_cat_walk_up;

portrait = noone;

ready = true;

// currently taking an action
acting = false;
image_speed = 1;
sprite_index = idle;

cooldown = function(){
	ready = false;
	alarm[1] = 10;
}

dialog_active = false;
dialog_pages = ["Default Actor Dialog"];
dialog_choices = [];
dialogCallback = function(choice) {
	show_debug_message($"A debug message from {object_index}")
}