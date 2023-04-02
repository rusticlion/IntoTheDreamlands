/// @description Insert description here
// You can write your code in this editor
accepts_input = true;
image_speed = 0;
win_count = 0;

cards = [12,12,12];

randomizeDeck = function() {
	repeat(6) {
		array_push(cards, irandom(array_length(global.card_index)))	
	}
}

bodyparts = [1,2,0,0,0,0];
gadgets = [0,1,2];

getDeck = function() {
	return array_shuffle(cards);	
}

getBody = function() {
	return bodyparts;	
}

getGadgets = function() {
	return gadgets;	
}