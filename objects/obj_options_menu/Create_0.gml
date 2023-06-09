/// @description Insert description here
// You can write your code in this editor
x_offset = camera_get_view_x(view_camera[0]);
y_offset = camera_get_view_y(view_camera[0]);
locked = false;

mouse_cursor = instance_create_layer(x_offset, y_offset, "MenuOverlay", obj_mouse_cursor);

instances_shown = [];
options = [
	{
		option_text: "Fullscreen",
		callback: function() {
			global.fullscreen = !global.fullscreen;
			window_set_fullscreen(global.fullscreen);
		},
		getState: function() {
			return global.fullscreen;
		}
	},
	{
		option_text: "Mouse Control",
		callback: function() {
			global.mouse_enabled = !global.mouse_enabled;
			obj_mouse_cursor.x = xOffset();
			obj_mouse_cursor.y = yOffset();
		},
		getState: function() {
			return global.mouse_enabled;
		}
	},
	{
		option_text: "Random Battles Mode",
		callback: function() {
			global.endless_mode = !global.endless_mode;	
		},
		getState: function() {
			return global.endless_mode;
		}
	},
	{
		option_text: "Dev Mode",
		callback: function() {
			global.devmode = !global.devmode;
		},
		getState: function() {
			return global.devmode;	
		}
	}
];

closeMenu = function() {
	instance_destroy(obj_mouse_cursor);
	obj_pause_menu.unlock();
	instance_destroy();	
}