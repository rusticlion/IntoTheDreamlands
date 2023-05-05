/// @description Insert description here
// You can write your code in this editor
top_frame = 0;
cursor = 0;
endpoint = array_length(obj_player.getItems())-1;
done_building = false;

obj_player.lock();
show_debug_message("Built item menu");
alarm[1] = 5;