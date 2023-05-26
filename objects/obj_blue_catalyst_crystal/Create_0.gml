/// @description Insert description here
// You can write your code in this editor
event_inherited();
hover_text = "Catalyst crystals generate dice based on factor.";
endOfDrawPhaseEffect = function() {
	owner.b_dice_modifier += owner.b_factor
	owner.refreshDicePool();
}