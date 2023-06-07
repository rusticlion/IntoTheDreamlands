/// @description Insert description here
// You can write your code in this editor
event_inherited();
sprite_index = spr_st_andrews_cross;
if (!obj_player.hasItem(obj_item004_blindfold)) {
	dialog_pages = ["Spattered with blood. Looks uncomfortable.", "A blindfold is threaded through one cuff."];
	dialog_choices = ["TAKE IT", "LEAVE IT"];
	choiceHandler = function(choice) {
		switch(choice) {
			case 0: 
				obj_player.gainItem(obj_item004_blindfold);
				dialog_pages = ["Spattered with blood. Looks uncomfortable."];
				dialog_choices = [];
			break;
			case 1:
				// nothing
			break
			default:
			break;
		}
	}
} else {
	dialog_pages = ["An X-shaped fixture with metal cuffs at each extreme. Spattered with blood."];
	dialog_choices = [];
}