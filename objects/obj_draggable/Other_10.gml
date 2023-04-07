/// @description click callback: pick up or put down
// You can write your code in this editor

if obj_mouse_cursor.holding == self {
	show_debug_message("clicked with a draggable held");
	event_user(1)
	obj_mouse_cursor.holding = "empty";
} else {
	obj_mouse_cursor.holding = self;
}