/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_blend = c_green;
pushbuttonEffect = function() {
	owner.modify_g_factor(-1);
	owner.g_dice_modifier += 1;
	owner.refreshDicePool();
}