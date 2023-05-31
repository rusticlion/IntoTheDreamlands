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
		if pool[i].object_index == obj_white_die {
			var replacement = instance_create_layer(0,0,"Pieces",obj_blk_die);
			if !pool[i].live {
				replacement.live = false;
				replacement.shows = pool[i].shows;
			}
			array_push(new_pool, replacement);
			instance_destroy(pool[i]);
		} else if pool[i].object_index == obj_green_die {
			var replacement = instance_create_layer(0,0,"Pieces",obj_red_die);
			if !pool[i].live {
				replacement.live = false;
				replacement.shows = pool[i].shows;
			}
			array_push(new_pool, replacement);
			instance_destroy(pool[i]);
		} else {
			array_push(new_pool, pool[i]);
		}
	}
	
	return new_pool;
}


cleanupEffect = function() {
	if owner.opponent.blood >= reference_blood_score {
		endEffect();	
	}
}
endEffect = function() {
	var isNotMe = function(_el, _idx) {
		return _el.object_index != obj_eff_frenzy;
	}
	var new_effects_list = array_filter(owner.effects, isNotMe)
	owner.effects = new_effects_list
	
	instance_destroy(self);
}