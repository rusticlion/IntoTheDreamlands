/// @description Insert description here
// You can write your code in this editor
upside = noone;
a_side_up = true;

getDicePool = function() {
	var pool = upside.getDice(controller);
	for(i=0;i<array_length(pool);i++) {
		pool[i].owner = controller;
	}
	return pool;
}

clashEffect = function() {
	upside.clashEffect(self);
}

cleanupEffect = function() {
	upside.cleanupEffect(self);	
}

checkFlipCondition = function() {
	upside.checkFlipCondition(self);
}

index_number = 0;