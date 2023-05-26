/// @description Override for unique Metatool menu behavior
// You can write your code in this editor

if (instance_exists(obj_dm)) {
	event_inherited();
} else if (instance_exists(obj_metatools_menu)) {
	// act like a draggable instead
	// of firing actual callbacks
	show_debug_message("metatools gadget behavior(drag)");
	if obj_mouse_cursor.holding == self {
		// drop if valid
		if (validPlacementCheck() = true) {
			event_user(1);
		}
	} else if obj_mouse_cursor.holding == noone {
		show_debug_message("picked up a gadget");
		obj_mouse_cursor.holding = self;
	}
}