/// @description Insert description here
// You can write your code in this editor
event_inherited();
pushbuttonEffect = function() {
	var g_was_spent = owner.modify_g_factor(-1);
	show_debug_message("Spent this much g:");
	show_debug_message(g_was_spent);
	if (g_was_spent) {
		show_debug_message("Incrementing g dice modifier");
		owner.g_dice_modifier += 1;
	}
	owner.refreshDicePool();
}