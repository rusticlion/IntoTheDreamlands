/// @description Insert description here
// You can write your code in this editor
if (sprite_index == spr_lever_off && obj_dm.player1.energy>0){
	sprite_index = spr_lever_on;
	obj_dm.player1.energy -= 1;
	leverEffect();
}