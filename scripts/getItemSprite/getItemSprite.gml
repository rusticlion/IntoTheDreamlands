// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getItemSprite(item_name){
	switch(item_name) {
		case noone:
			return spr_empty;
		break;
		case "WRENCH":
			return spr_wrench;
		break;
		case "BLINDFOLD":
			return spr_blindfold;
		break;
		case "BOLT CUTTERS":
			return spr_bolt_cutters;
		break;
		case "SHOVEL":
			return spr_shovel;
		break;
		case "DEVIL'S BRUSH":
			return spr_devils_brush;
		break;
		case "KEY":
			return spr_key;
		break;
		default:
			return spr_debug_duck;
		break;
	}
}