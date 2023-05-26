/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_dm) {
	switch (state) {
		case "UNPUSHED":
			if (owner.energy>0) {
				state = "PUSHED";
				owner.energy-=1;
				injectorEffect();
			}
		break;
		case "PUSHED":
		break;
		default:
		break;
	
	}
} else if (instance_exists(obj_metatools_menu)) {
	event_inherited();	
}
