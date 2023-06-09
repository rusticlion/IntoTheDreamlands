/// @description New version of DM.

// SECTION
// PREFLIGHT
// locks player. Any other side effect prevention
// from persisted instances should also happen here.
obj_player.visible = false;
obj_player.lock();

// SECTION
// BASELINE
// Set up starting state flags for control flow
game_view = "home";
phase = "SETUP";

// SECTION
// PROVISION
// Set up resources for the duel

// Instantiate duelists
player1 = instance_create_layer(0,0,"Pieces",obj_duelist);
if global.duel_parameters.player1 == obj_player {
	player1.name = global.playername;
	player1.ai = false;
} else {
	player1.name = global.duel_parameters.player1;
	player1.ai = true;
}
duelist_2 = instance_create_layer(0,0,"Pieces",obj_duelist);
duelist_2.ai = true;
if global.endless_mode {
	duelist_2.name = pickRandomUnfoughtEnemy();
} else {
	duelist_2.name = global.duel_parameters.duelist_2;
}
player1.duelist_id = 1;
duelist_2.duelist_id = 2;
player1.opponent = duelist_2;
duelist_2.opponent = player1;
d1 = player1;
d2 = duelist_2;

// Get lists of duel pieces
d1_cards = d1.getDeck();
d1_discard = [];
d1_bp_list = d1.getBody();
d1_gadget_list = d1.getGadgets();

d2_cards = d2.getDeck();
d2_discard = [];
d2_bp_list = d2.getBody();
d2_gadget_list = d2.getGadgets();

// Instantiate duel pieces

// State transition functions (actions):

// Helper functions

pickRandomUnfoughtEnemy = function() {
	var foes = ["CHESHIRE LION", "DRAGON", "MANTIS SENSEI", "BONE DEMON", "TREASURE WIGHT", "BONE GARGOYLE", "KRAKEN"];
	var enemy = noone
	var candidate = foes[irandom(array_length(foes)-1)];
	var already_fought = false;
	for (var i=0;i<array_length(global.dreamforms_unlocked);i++) {
		if (candidate == global.dreamforms_unlocked[i]) {
			already_fought = true;
		}
	}
	if (!already_fought) {
		enemy = candidate;
	}
	return enemy;
}

