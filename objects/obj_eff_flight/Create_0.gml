/// @description Insert description here
// You can write your code in this editor
event_inherited();
hover_text = "Flight provides two green dice."

modifyDicePool = function(pool) {
	repeat (2) {
		extra_g_die = instance_create_layer(0,0,"Pieces",obj_green_die)
		array_push(pool, extra_g_die);
	}
	return pool;
}

endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_flight;
	}
	var new_effects_list = array_filter(owner.effects, isNotMe)
	owner.effects = new_effects_list
	
	instance_destroy(self);
}