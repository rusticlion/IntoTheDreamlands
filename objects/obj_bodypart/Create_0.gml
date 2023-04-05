/// @description Insert description here
// You can write your code in this editor
hp = 2;
available_to_clash = true;
attack_slot = noone;
defense_slot = noone;


evaluate = function() {
	if (hp == 0) {
		// do whatever "dead" callbacks
	
	// note the assumption here that slots exist if hp > 0
	} else {
		var attack_score = attack_slot.power_score;
		var defense_score = defense_slot.difficulty;
		
		if (attack_score > 19) {
			attack_score = "HYPER";
		} else if (attack_score > 9) {
			attack_score = "SUPER";
		}
		
		if (defense_score > 19) {
			defense_score = "HYPER";
		} else if (defense_score > 9) {
			defense_score = "SUPER";
		}
		
		
		if (defense_score == "HYPER") {
			deflect();
		} else if (attack_score == "HYPER") {
			damage();
		} else if (defense_score == "SUPER") {
			deflect();
		} else if (attack_score == "SUPER") {
			damage();
		} else if (attack_score > defense_score) {
			damage();	
		} else if (attack_score > 0) {
			deflect();	
		} else {
			notAttacked();
		}
	}
}

damage = function() {
	var dph = 1;
	if (controller.opponent.active_card.upside.brutal) {
		dph += 1;
	}
	hp = clamp(hp-dph, 0, 2);
	if (hp == 1) {
		controller.blood -= 1;
		image_blend = c_yellow;
	} else {
		controller.blood -= blood_value;
		image_blend = c_red;
		instance_destroy(attack_slot);
		instance_destroy(defense_slot);
	}
	
}

deflect = function() {
	
}

notAttacked = function() {
	
}

spawnSlots = function() {
	if controller == obj_dm.player1 {
		bp_for_slot = self
		show_debug_message("Own Class: ")
		show_debug_message(object_get_name(bp_for_slot.object_index))
		show_debug_message(self.toughness)
		self.defense_slot = instance_create_layer(x - 16, y-2, "Slots", obj_defense_slot, {bodypart: bp_for_slot});
		self.attack_slot = instance_create_layer(x - 32, y - 130, "Slots", obj_attack_slot, {bodypart: bp_for_slot});
	} else {
		bp_for_slot = self
		self.defense_slot = instance_create_layer(x + 32, y-2, "Slots", obj_defense_slot, {bodypart: bp_for_slot});
		self.attack_slot = instance_create_layer(x + 48, y + 130, "Slots", obj_attack_slot, {bodypart: bp_for_slot});
	}
}

switchOnSplendor = function() {
	attack_slot.activateSplendor();	
}

switchOffSplendor = function() {
	attack_slot.deactivateSplendor();	
}

respawnBodypart = function() {
	spawnSlots();
	image_blend = noone;
	controller.blood += blood_value;
	hp = 2;
}

spawnSlots();