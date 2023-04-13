/// @description Insert description here
// You can write your code in this editor
keys = [];
field = "";
cursor = 0;
alphabet = [
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "'", "-", "!", " "
]

field_x_origin = x;
field_y_origin = y - 2*global.tile_size;

for (var i=0;i<10;i++) {
	var new_key = instance_create_layer(x+global.tile_size*i, y, "Instances", obj_letter_tile, {letter: alphabet[i]});
	array_push(keys, new_key);
}
for (var i=10;i<20;i++) {
	var new_key = instance_create_layer(x+global.tile_size*(i-10), y+global.tile_size*1, "Instances", obj_letter_tile, {letter: alphabet[i]});
	array_push(keys, new_key);
}
for (var i=20;i<30;i++) {
	var new_key = instance_create_layer(x+global.tile_size*(i-20), y+global.tile_size*2, "Instances", obj_letter_tile, {letter: alphabet[i]});
	array_push(keys, new_key);
}

click = function() {
	show_debug_message("clicked with cursor on "+alphabet[cursor]);
	if (cursor == 29) {
		submit();
	} else if(string_length(field)<10) {
		field += alphabet[cursor];
		show_debug_message("updated field to: "+field);
	} else {
		submit();
	}
}
