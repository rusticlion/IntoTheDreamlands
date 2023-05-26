// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save(player_id){
	function packList(player_id, global_address, list_name) {
		var stringified_list = string_join_ext(",", global_address);
		ini_write_string(player_id, list_name, stringified_list);
	}
	
	function packItems(player_id, item_array, item_list_name) {
		var string_representations = [];
		for (var i=0;i<array_length(item_array);i++) {
			var item_name = item_array[i].name;
			array_push(string_representations, item_name);
		}
		var stringified_list = string_join_ext(",", string_representations);
		ini_write_string(player_id, item_list_name, stringified_list);
	}
	
	function packGadgets(player_id, gadget_array, gadget_list_name) {
		var string_representations = [];
		for (var i=0;i<array_length(gadget_array);i++) {
			var g = gadget_array[i];
			var gadget_index = string(g.gadget_index);
			var g_x_coordinate = string(g.xx);
			var g_y_coordinate = string(g.yy);
			var stringified_gadget = gadget_index+"$"+g_x_coordinate+"$"+g_y_coordinate;
			array_push(string_representations, stringified_gadget);
		}
		var stringified_list = string_join_ext(",", string_representations);
		ini_write_string(player_id, gadget_list_name, stringified_list);
	}
	ini_open("Settings/savedata.ini");
	
	// Save strings
	ini_write_string(player_id, "playername", global.playername);
	ini_write_string(player_id, "player_cat_name", global.player_cat_name);
	ini_write_string(player_id, "phase", global.phase);
	
	// Save real values
	ini_write_real(player_id, "player_sprite", global.player_sprite);
	ini_write_real(player_id, "room", room);
	ini_write_real(player_id, "endless_mode", global.endless_mode);
	ini_write_real(player_id, "mouse_enabled", global.mouse_enabled);
	ini_write_real(player_id, "fullscreen", global.fullscreen);
	
	// Save lists
	packList(player_id, global.dreamforms_unlocked, "dreamforms_unlocked");
	packList(player_id, obj_player.bodyparts, "equipped_bodyparts");
	packList(player_id, obj_player.bodyparts_hp, "equipped_bodyparts_hitpoints");
	
	packItems(player_id, obj_player.realworld_items, "realworld_items");
	packItems(player_id, obj_player.dreamlands_items, "dreamlands_items");
	
	packGadgets(player_id, obj_player.equipped_gadgets, "equipped_gadgets");
	packGadgets(player_id, obj_player.unlocked_gadgets, "unlocked_gadgets");
	show_debug_message("saved:");
	show_debug_message(obj_player.unlocked_gadgets);
	ini_close();
	show_debug_message("Saved the game.");
}