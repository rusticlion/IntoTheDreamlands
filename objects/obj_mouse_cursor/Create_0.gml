/// @description Insert description here
// You can write your code in this editor
ready = true;
holding = noone;


readyTimer = function() {
	ready = false;
	alarm[0] = 3;	
}

setDefaultHovertext = function() {
	if instance_exists(obj_dm) {
		obj_duel_dialog_box.text = obj_dm.player2.name
	} else if instance_exists(obj_dreamform_menu) {
		obj_menu_dialog.text = obj_dreamform_menu.selectedBodypart().hover_text;	
	}
}

sendClick = function() {	
	target = instance_nearest(x, y, obj_clickable);
	show_debug_message("Click target: "+string(target));

	if (target != noone && target.locked == false) {
		show_debug_message("target is valid!");
		if instance_position(x, y, target) {
			show_debug_message("target collides with cursor");
			with (target) {
				event_user(0); //click callback
			}
		} else if (target.x == x && target.y == y) {
			show_debug_message("target coincides with cursor");
			with (target) {
				event_user(0); //click callback
			}
		} else {
			show_debug_message("no collision with target "+string(target.x)+","+string(target.y))
			show_debug_message("from mouse position "+string(x)+","+string(y))
		}
	}
}