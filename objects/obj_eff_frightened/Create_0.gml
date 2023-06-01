/// @description Insert description here
// You can write your code in this editor
event_inherited();
hover_text = "Incandescent fury converts your defenses into attacks, until you calm down."

// imperfect implementation. really, should somehow determine whether any 
// dice were assigned to opponent's attack slots - DOTs, self-inflicted damage
// etc. should not perpetuate Frenzy., but for now they will.
reference_blood_score = owner.opponent.blood;

modifyDicePool = function(pool) {
	reference_blood_score = owner.opponent.blood;
	
	var new_pool = [];
	for(var i=0;i<array_length(pool);i++) {
		if (pool[i]) {
			
		} else {
			array_push(new_pool, pool[i]);
		}
	}
	
	return new_pool;
}

clashEffect = function() {
	var pool_to_sort = [];
	array_copy(pool_to_sort, 0, owner.dice_pool, 0, array_length(owner.dice_pool));
	var sorted_pool = array_sort(pool_to_sort, function(el1, el2) {
		return el1.shows - el2.shows;
	});
	var pool_less_best_die = [];
	array_copy(pool_less_best_die, 0, sorted_pool, 1, array_length(sorted_pool)-1);
}

cleanupEffect = function() {
	if owner.opponent.blood < reference_blood_score {
		endEffect();	
	}
}
endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_frightened;
	}
	var new_effects_list = array_filter(owner.effects, isNotMe)
	owner.effects = new_effects_list
	
	instance_destroy(self);
}