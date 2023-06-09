/// @description Insert description here
// You can write your code in this editor
event_inherited();
hover_text = "A simple metatool for direct manipulation."
leverEffect = function() {
	if owner.energy > 0 {
		owner.energy--;
		owner.toggleDecision();
		owner.refreshDicePool();
	}
}