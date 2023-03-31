/// @description Insert description here
// You can write your code in this editor
accepts_input = true;
image_speed = 0;
win_count = 0;

cards = [];

repeat (3) {
	array_push(cards, irandom(8)+1);
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