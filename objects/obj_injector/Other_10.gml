/// @description Insert description here
// You can write your code in this editor
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