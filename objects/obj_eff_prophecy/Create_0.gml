/// @description Insert description here
// You can write your code in this editor
event_inherited();
show_debug_message("added a Prophecy effect")

modifyDicePool = function(pool) {
	if owner.opponent.doomed() {
		extra_b_die = instance_create_layer(0,0,"Pieces",obj_blue_die,{live: false, shows: 10});
	} else {
		extra_b_die = instance_create_layer(0,0,"Pieces",obj_blue_die);
	}
	
	array_push(pool, extra_b_die);
	return pool;
}

endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_prophecy;
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