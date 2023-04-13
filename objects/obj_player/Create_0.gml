/// @description Insert description here
// You can write your code in this editor
accepts_input = true;
image_speed = 0;
win_count = 0;
dreamform = "BEAST MAN";

bodyparts = [4,8,1,1,1,1];
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

lock = function() {
	accepts_input = false;	
}

unlock = function() {
	accepts_input = true;	
}

getDeck = function() {
	bodyparts = obj_ai_duelist.getBody(dreamform);
	return array_shuffle(bodyparts);	
}

getBody = function() {
	bodyparts = obj_ai_duelist.getBody(dreamform);
	return bodyparts;	
}

getGadgets = function() {
	return gadgets;	
}

registerWin = function(opp_name) {
	var already_unlocked = false;
	for (var i=0;i<array_length(global.dreamforms_unlocked);i++) {
		if (opp_name == global.dreamforms_unlocked[i]) {
			already_unlocked = true;
		}
	}
	if (!already_unlocked) {
		array_push(global.dreamforms_unlocked, opp_name);
	}
}