/// @description Insert description here
// You can write your code in this editor
event_inherited();
pushbuttonEffect = function() {
	var r_was_spent = owner.modify_r_factor(-1);
	if (r_was_spent) {
		owner.r_dice_modifier += 1;
	}
	owner.refreshDicePool();
}