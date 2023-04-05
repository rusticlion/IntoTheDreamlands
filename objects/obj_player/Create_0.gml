/// @description Insert description here
// You can write your code in this editor
accepts_input = true;
image_speed = 0;
win_count = 0;

bodyparts = [6,8,12,12,1,1];
gadgets = [
	{
		xx: 1*global.tile_size,
		yy: 20*global.tile_size,
		gadget_index: 4
	},
	{
		xx: 1*global.tile_size,
		yy: 22*global.tile_size,
		gadget_index: 5
	},
	{
		xx: 1*global.tile_size,
		yy: 24*global.tile_size,
		gadget_index: 6
	},
	{
		xx: 2*global.tile_size,
		yy: 20*global.tile_size,
		gadget_index: 7
	},
	{
		xx: 2*global.tile_size,
		yy: 22*global.tile_size,
		gadget_index: 8
	},
	{
		xx: 2*global.tile_size,
		yy: 24*global.tile_size,
		gadget_index: 9
	},
];

getDeck = function() {
	return array_shuffle(bodyparts);	
}

getBody = function() {
	return bodyparts;	
}

getGadgets = function() {
	return gadgets;	
}