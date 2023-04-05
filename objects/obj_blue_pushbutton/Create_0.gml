/// @description Insert description here
// You can write your code in this editor
event_inherited();
pushbuttonEffect = function() {
	var b_was_spent = owner.modify_b_factor(-1);
	if (b_was_spent) {
		owner.b_dice_modifier += 1;
	}
	owner.refreshDicePool();
}