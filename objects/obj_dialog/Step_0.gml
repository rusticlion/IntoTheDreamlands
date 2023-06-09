/// @description Insert description here
// You can write your code in this editor
var pageLength = string_length(pages[cursor]);
var currentTextAnimating = typewriterProgress < pageLength;

if (currentTextAnimating) {
	++typewriterProgress;	
}

if keyboard_check_released(ord("Z")) {
	var debug_message = "Got a click in dialog:";
	if currentTextAnimating {
		debug_message += " Skipped typewriter forward.";
		typewriterProgress = pageLength;	
	} else {
		debug_message += " Typing finished:"
		if (cursor < endpoint) {
			debug_message += " Next page.";
			typewriterProgress = 0;
			cursor++;
		} else if (has_choices && !show_choices) {
			debug_message += " Showing choices.";
			show_choices = true;	
		} else {
			debug_message += " Made a choice or got to end, firing callback and closing dialog";
			if instance_number(obj_dialog) == 1 {
				obj_game.dialog_active = false;
			}
			callback(choice_cursor);
			instance_destroy();
		} 
	}
	show_debug_message(debug_message);
} else if (keyboard_check_released(vk_up)){
	choice_cursor = clamp(choice_cursor-1,0,array_length(choices)-1)
} else if (keyboard_check_released(vk_down)) {
	choice_cursor = clamp(choice_cursor+1,0,array_length(choices)-1)
}