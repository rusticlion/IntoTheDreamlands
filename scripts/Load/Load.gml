// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(player_id){
	// helper functions
	function unpackStringList(player_id,list_name,default_value="") {
		var raw_list = ini_read_string(player_id, list_name, default_value);
		show_debug_message("read a raw list: \n"+string(raw_list));
		return string_split(raw_list, ",");
	}
	function unpackRealList(player_id,list_name,default_value="") {
		var raw_list = ini_read_string(player_id, list_name, default_value);
		if raw_list == "" {
			return [];	
		} else {
			var str_array = string_split(raw_list, ",");
			return array_map(str_array, real);
		}
	}
	function unpackItems(player_id, item_list_name, default_value="") {
		var item_index_list = unpackRealList(player_id, item_list_name, default_value);
		var holding_list = [];
		for (var i=0;i<array_length(item_index_list);i++) {
			var item_obj_index = item_index_list[i];
			if (item_obj_index != 0) {
				array_push(holding_list, item_obj_index);
			}
		}
		return holding_list
	}
	function unpackGadgets(player_id, gadget_list_name, default_value="") {
		var gadget_string_list = unpackStringList(player_id, gadget_list_name, default_value);
		show_debug_message("gadget_string_list: \n");
		show_debug_message(gadget_string_list);
		var gadgets_list = [];
		for (var i=0;i<array_length(gadget_string_list);i++) {
			var string_rep_of_one_gadget = gadget_string_list[i];
			var list_rep = string_split(string_rep_of_one_gadget, "$");
			show_debug_message("deserialized one gadget as: \n"+string(list_rep))
			var gadget_idx = real(list_rep[0]);
			var gadget_x = real(list_rep[1]);
			var gadget_y = real(list_rep[2]);
			var gadget = {
				gadget_index: gadget_idx,
				xx: gadget_x,
				yy: gadget_y
			}
			show_debug_message("structured one gadget as: \n"+string(gadget));
			array_push(gadgets_list, gadget);
		}
		return gadgets_list;
	}
	
	ini_open("Settings/savedata.ini");
	
	// load strings
	global.playername = ini_read_string(player_id, "playername", "Ducky");
	global.player_cat_name = ini_read_string(player_id, "player_cat_name", "Ducky");
	global.phase = ini_read_string(player_id, "phase", "REAL WORLD");
	// load real values
	global.player_sprite = ini_read_real(player_id, "player_sprite", 0);
	global.saved_room = ini_read_real(player_id, "room", Bedroom);
	global.endless_mode = ini_read_real(player_id, "endless_mode", false);
	global.mouse_enabled = ini_read_real(player_id, "mouse_enabled", false);
	global.fullscreen = ini_read_real(player_id, "fullscreen", false);
	
	// unpack and load lists 
	global.dreamforms_unlocked = unpackStringList(player_id, "dreamforms_unlocked", "BASIC PERSON");
	global.equipped_bodyparts = unpackRealList(player_id, "equipped_bodyparts", ""); // give a better default
	global.equipped_bodyparts_hitpoints = unpackRealList(player_id, "equipped_bodyparts_hitpoints", "");
	global.equipped_gadgets = unpackGadgets(player_id, "equipped_gadgets", "");
	global.unlocked_gadgets = unpackGadgets(player_id, "unlocked_gadgets", "");
	
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

function loadEquippedGadgetsFromGlobal() {
	return global.equipped_gadgets;
}

function loadUnlockedGadgetsFromGlobal() {
	return global.unlocked_gadgets;	
}