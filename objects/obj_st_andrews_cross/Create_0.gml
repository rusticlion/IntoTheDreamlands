/// @description Insert description here
// You can write your code in this editor
event_inherited();
sprite_index = spr_st_andrews_cross;
valid_states = ["BLINDFOLD_PRESENT", "BLINDFOLD_LOOTED"];
state = valid_states[0];

getLoot = function() {
	if (state == "BLINDFOLD_PRESENT") {
		state = "BLINDFOLD_LOOTED";
		obj_player.gainItem(obj_item004_blindfold);
	}
}


state_0_dialog_pages = ["Spattered with blood. Looks uncomfortable.", "A blindfold is threaded through one cuff."];
state_0_dialog_choices = ["TAKE IT", "LEAVE IT"];
state_0_dialogCallback = function(choice) {
	switch(choice) {
		case 0:
			getLoot();
		break;
		case 1:
			// nothing
		break
		default:
		break;
	}
}

state_1_dialog_pages = ["Looks uncomfortable."];