/// @description Insert description here
// You can write your code in this editor
event_inherited();
hover_text = "Splendor grants\nindifference to the\nmundane."

for(var i=0;i<array_length(owner.bodyparts);i++) {
	owner.bodyparts[i].switchOnSplendor();
}

blood_score_when_splendor_began = owner.blood;

cleanupEffect = function() {
	if owner.blood < blood_score_when_splendor_began {
		endEffect();	
	}
}

endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_splendor;
	}
	var new_effects_list = array_filter(owner.effects, isNotMe)
	owner.effects = new_effects_list
	
	for(var i=0;i<array_length(owner.bodyparts);i++) {
		owner.bodyparts[i].switchOffSplendor();
	}
	instance_destroy(self);
}