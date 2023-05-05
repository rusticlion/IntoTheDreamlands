/// @description Dialog box.
// expect (pages[], choices[])

// Should display on top or bottom of screen
// to show player if possible. Prefer bottom.

// Should lock the player in place.

// Should display a character portrait if present.
// Should show dialog one page at a time.
// Should take choice before concluding if present.
// Should perform handler when dialog concludes.

cursor = 0;
endpoint = array_length(pages)-1;
show_blinker = false;
show_choices = false;
choice_cursor = 0;

typewriterProgress = 0;

if array_length(choices)>0 {
	has_choices = true;	
} else {
	has_choices = false;	
}

// do some logic to position window and lock player
obj_player.lock();

if (obj_player.y > global.tile_size*6+camera_get_view_y(view_camera[0])) {
	position = "TOP";
	x = 0;
	y = 0;
} else {
	position = "BOTTOM";
	x = 0;
	y = global.tile_size*7;
}

if (cursor < endpoint) {
	alarm[0] = 10;
}

choiceHandler = function(choice) {
	show_debug_message("Finished a choice but no handler assigned!"+string(choice));
}

show_debug_message("spawned a dialog box starting with: "+pages[0]);