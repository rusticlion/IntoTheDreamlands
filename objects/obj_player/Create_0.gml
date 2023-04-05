/// @description Insert description here
// You can write your code in this editor
accepts_input = true;
image_speed = 0;
win_count = 0;

randomizeDeck = function() {
	repeat(6) {
		array_push(cards, irandom(array_length(global.card_index)))	
	}
}

bodyparts = [6,8,12,12,1,1];
gadgets = [3,7,5];

getDeck = function() {
	return array_shuffle(bodyparts);	
}

getBody = function() {
	return bodyparts;	
}

getGadgets = function() {
	return gadgets;	
}