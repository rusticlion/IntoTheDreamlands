// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(player_id){
	// helper functions
	function unpackStringList(player_id,list_name,default_value="") {
		var raw_list = ini_read_string(player_id, list_name, default_value);
		return string_split(raw_list, ",");
	}
	function unpackRealList(player_id,list_name,default_value="") {
		var raw_list = ini_read_string(player_id, list_name, default_value);
		var str_array = string_split(raw_list, ",");
		return array_map(str_array, real);
	}
	function unpackItems(player_id, item_list_name, default_value="") {
		var item_string_list = unpackStringList(player_id, item_list_name, default_value);
		var holding_list = [];
		for (var i=0;i<array_length(item_string_list);i++) {
			var item_obj_index = getItemObject(item_string_list);
			if (item_obj_index != obj_debug_duck) {
				array_push(holding_list, item_obj_index);
			}
		}
		return holding_list
	}
	
	ini_open("Settings/savedata.ini");
	
	// load strings
	global.playername = ini_read_string(player_id, "playername", "Ducky");
	global.player_cat_name = ini_read_string(player_id, "player_cat_name", "Ducky");
	global.phase = ini_read_string(player_id, "phase", "REAL WORLD");
	// load real values
	global.player_sprite = ini_read_real(player_id, "player_sprite", 0);
	global.saved_room = ini_read_real(player_id, "room", Bedroom);
	show_debug_message("loaded player into this room: "+string(global.saved_room));
	
	// unpack and load lists 
	global.dreamforms_unlocked = unpackStringList(player_id, "dreamforms_unlocked", "BEAST MAN");
	global.equipped_bodyparts = unpackRealList(player_id, "equipped_bodyparts", ""); // give a better default
	global.equipped_bodyparts_hitpoints = unpackRealList(player_id, "equipped_bodyparts_hitpoints", "");
	
	
	global.dreamlands_items = unpackItems(player_id, "dreamlands_items", "");
	show_debug_message("unpacked Dreamlands bag: "+string(global.dreamlands_items));
	global.realworld_items = unpackItems(player_id, "realworld_items", "");
	
	show_debug_message("loaded this realworld item list"+string(global.realworld_items));
	ini_close();
	
	show_debug_message("loading this room: "+string(room_get_name(global.saved_room)))
	room_goto(global.saved_room);
}

function loadBodyFromGlobal() {
	return global.equipped_bodyparts;
}

function loadBodyHPFromGlobal() {
	return global.equipped_bodyparts_hitpoints;	
}