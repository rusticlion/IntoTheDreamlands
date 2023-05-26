/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_dm) {
	if (state == "READY"){
		state = "PUSHING";
		pushbuttonEffect();
	}
} else if instance_exists(obj_metatools_menu) {
	event_inherited();	
}