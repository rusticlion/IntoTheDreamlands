// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Save(player_id){
	ini_open("Settings/savedata.ini");
	ini_write_string(player_id, "playername", global.playername);
	ini_write_string(player_id, "player_cat_name", global.player_cat_name);
	var stringed_dreamforms_list = string_join_ext(",", global.dreamforms_unlocked);
	show_debug_message("saving a formatted forms list: "+stringed_dreamforms_list);
	ini_write_string(player_id, "dreamforms_unlocked", stringed_dreamforms_list);
	ini_close();
	show_debug_message("Saved the game.");
}