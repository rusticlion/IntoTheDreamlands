/// @description Insert description here
// You can write your code in this editor
valid_states = ["PENDING", "IN_PROGRESS", "DONE"];
state = valid_states[0];

preCombat = function() {
	originating_room = room;
}

startCombat = function() {
	preCombat();
	state = valid_states[1];
	room_goto(Duel);
}

endCombat = function() {
	state = valid_states[2];
	room_goto(originating_room);	
}

postCombat = global.duel_parameters.victoryHandler;