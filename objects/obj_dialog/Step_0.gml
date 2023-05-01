/// @description Insert description here
// You can write your code in this editor
var pageLength = string_length(pages[cursor]);
var currentTextAnimating = typewriterProgress < pageLength;

if (currentTextAnimating) {
	++typewriterProgress;	
}

if (show_choices && keyboard_check_released(ord("Z"))) {
	choiceHandler(choice_cursor);
	instance_destroy();
} else if (!show_choices && keyboard_check_released(ord("Z"))) {
    // If there is more of the current text, skip to the end
    if (currentTextAnimating) {
		typewriterProgress = pageLength;
    }
    // Otherwise, advance to the next page if there is more to show, self-destruct otherwise
    else {
        if (cursor < endpoint) {
            typewriterProgress = 0;
			cursor++;
        } else if (has_choices){
			show_choices = true;
        } else {
			// complete non-choice box
			instance_destroy();
		}
    }
} else if (keyboard_check_released(vk_up)){
	choice_cursor = clamp(choice_cursor-1,0,array_length(choices)-1)
} else if (keyboard_check_released(vk_down)) {
	choice_cursor = clamp(choice_cursor+1,0,array_length(choices)-1)
}