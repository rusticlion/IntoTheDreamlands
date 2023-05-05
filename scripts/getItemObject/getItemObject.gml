// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getItemObject(item_name){
	show_debug_message("loading full item from uid: "+string(item_name))
	switch(item_name) {
		case "WRENCH":
			return obj_wrench;
		break;
		case "BLINDFOLD":
			return obj_blindfold;
		break;
		case "BOLT CUTTERS":
			return obj_bolt_cutters;
		break;
		case "SHOVEL":
			return obj_shovel;
		break;
		case "DEVIL'S BRUSH":
			return obj_devils_brush;
		break;
		case "KEY":
			return obj_key;
		break;
		default:
			return obj_debug_duck;
		break;
	}
}