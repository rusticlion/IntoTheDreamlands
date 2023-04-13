// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function letter_drawing(x_pos,y_pos,text,options={color: c_white}){
	var letters = [];
	for (var i=1;i<string_length(text)+1;i++) {
		show_debug_message("building instance for: "+string_char_at(text, i));
		var letter = instance_create_layer(x_pos+global.tile_size*i, y_pos, "Instances", obj_letter_tile, {letter: string_char_at(text, i), color: options.color});
		array_push(letters, letter);
	}
	return letters;
}