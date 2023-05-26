/// @description Insert description here
// You can write your code in this editor
event_inherited();
hover_text = "You don't feel so good...";

// infect a non-zombie part if one exists
cleanupEffect = function() {
	var found = false;
	var shuffled_bps = array_shuffle(owner.bodyparts);
	for(var i=0;i<array_length(owner.bodyparts) && !found;i++) {
		var bp = shuffled_bps[i];
		if (bp.object_index == obj_bp014_rotting_ribcage) {
			
		} else if (bp.object_index == obj_bp015_brain_pan) {
			
		} else if (bp.object_index == obj_bp016_dead_arm) {
			
		} else if (bp.object_index == obj_bp017_shambling_leg) {
			
		} else {
			found = true;
			var bp_index = array_get_index(owner.bodyparts, bp);
			if bp.bp_class == "HEAD" {
				obj_dm.replaceBP(owner, bp_index, 15); // index_number for Brain Pan
			} else if bp.bp_class == "BODY" {
				obj_dm.replaceBP(owner, bp_index, 14);
			} else if bp.bp_class == "LIMB" {
				if (i > 3) { // "leg zone"
					obj_dm.replaceBP(owner, bp_index, 17);
				} else {
					obj_dm.replaceBP(owner, bp_index, 16);
				}
			}
		}
	}
}



endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_zombie_infection;
	}
	var new_effects_list = array_filter(owner.effects, isNotMe)
	if(new_effects_list == noone) {
		new_effects_list = [];	
	}
	owner.effects = new_effects_list
	instance_destroy(self);
}