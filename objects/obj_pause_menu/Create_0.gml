/// @description Insert description here
// You can write your code in this editor
cursor = 0;
locked = false;
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

lock = function() {
	visible = false;
	locked = true;	
}

unlock = function() {
	visible = true;
	alarm[0] = 1;	
}

click_dreamform = function() {
	lock();
	x_offset = camera_get_view_x(view_camera[0]);
	y_offset = camera_get_view_y(view_camera[0]);
	instance_create_layer(x_offset,y_offset,"Overlay",obj_dreamform_menu);
}

click_metatools = function() {
	lock();
	x_offset = camera_get_view_x(view_camera[0]);
	y_offset = camera_get_view_y(view_camera[0]);
	instance_create_layer(x_offset,y_offset,"Overlay",obj_metatools_menu);
}

click_esoterica = function() {
	show_debug_message("not implemented!");
}

click_save = function() {
	Save("player1");
}

click_options = function() {
	lock();
	x_offset = camera_get_view_x(view_camera[0]);
	y_offset = camera_get_view_y(view_camera[0]);
	instance_create_layer(x_offset,y_offset,"Overlay", obj_options_menu);
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
