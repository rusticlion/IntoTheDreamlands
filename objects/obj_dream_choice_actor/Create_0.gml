/// @description Insert description here
// You can write your code in this editor
event_inherited();

portrait = spr_cat_1;

if global.devmode {
	dialog_pages = ["Which dream?"];
	dialog_choices = ["Basement", "School", "Never mind"];
	dialogCallback = function(choice) {
		switch(choice) {
			case 0:
				room_goto(DemonBasement);
			break;
			case 1:
				room_goto(BackAtSchool);
			break;
			case 2:
				// nothing
			break;
			default:
			break;
		}
	}
	
} else {
	dialog_pages = [global.player_cat_name+" is swishing their tail back and forth."];
	dialog_choices = ["SCRITCH", "DON'T"];
	dialogCallback = function(choice) {
		switch(choice) {
			case 0:
				buildDialog([global.player_cat_name+" purrs contentedly."]);
			break;
			default:
				buildDialog([global.player_cat_name+" looks offended."]);
			break;
		}
	}
}
