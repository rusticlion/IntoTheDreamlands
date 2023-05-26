/// @description Insert description here
// You can write your code in this editor
event_inherited();
image_blend = c_red;
hover_text = "Catalyst crystals generate dice based on factor.";
endOfDrawPhaseEffect = function() {
	owner.r_dice_modifier += owner.r_factor;
	owner.refreshDicePool();
}