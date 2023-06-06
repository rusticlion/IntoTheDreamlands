/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_blend = c_fuchsia;

dialog_pages = ["Which dream?"];
dialog_choices = ["Basement", "School", "Never mind"];
choiceHandler = function(choice) {
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