/// @description Insert description here
// You can write your code in this editor
var targetTextProgress = string_length(texts[textIndex]);
var currentTextAnimating = typewriterProgress < targetTextProgress;

if (currentTextAnimating) {
	++typewriterProgress;	
}

if (keyboard_check_pressed(vk_enter)) {
    // If there is more of the current text, skip to the end
    if (currentTextAnimating) {
		typewriterProgress = targetTextProgress;
    }
    // Otherwise, advance to the next text if there is more to show, self-destruct otherwise
    else {
        if (++textIndex < array_length(texts)) {
            typewriterProgress = 0;
        } else {
			//"complete textbox" hook, ideally
			obj_bedroom_downstair.alarm[0] = 16;
			obj_player.walkLeft();
			
            instance_destroy();
        }
    }
}