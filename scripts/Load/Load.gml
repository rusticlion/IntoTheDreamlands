// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Load(player_id){
	ini_open("Settings/savedata.ini");
	
	global.playername = ini_read_string(player_id, "playername", "Ducky");
	
	global.player_cat_name = ini_read_string(player_id, "player_cat_name", "Ducky");
	
	var rawFormsList = ini_read_string(player_id, "dreamforms_unlocked", "BEAST MAN")
	global.dreamforms_unlocked = string_split(rawFormsList, ",");
	
	global.player_sprite = ini_read_real(player_id, "player_sprite", 0);
	
	ini_close();
}