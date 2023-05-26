/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_blend = c_green;
hover_text = "Catalyst crystals generate dice based on factor.";
endOfDrawPhaseEffect = function() {
	owner.g_dice_modifier += owner.g_factor;
	owner.refreshDicePool();
}