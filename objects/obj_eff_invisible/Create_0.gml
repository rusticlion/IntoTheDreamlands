/// @description Insert description here
// You can write your code in this editor
event_inherited();

for(var i=0;i<array_length(owner.bodyparts);i++) {
	owner.bodyparts[i].toughness += 5;
	if (owner.bodyparts[i].hp > 0) {
		owner.bodyparts[i].defense_slot.reset();
	}
}

blood_score_when_invisibility_began = owner.blood;

cleanupEffect = function() {
	if owner.blood < blood_score_when_invisibility_began {
		endEffect();	
	}
}

endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_invisible;
	}
	var new_effects_list = array_filter(owner.effects, isNotMe)
	owner.effects = new_effects_list
	
	for(var i=0;i<array_length(owner.bodyparts);i++) {
		owner.bodyparts[i].toughness -= 5;
		if (owner.bodyparts[i].hp > 0) {
			owner.bodyparts[i].defense_slot.reset();
		}
	}
	instance_destroy(self);
}