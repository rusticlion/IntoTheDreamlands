// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnterRoom(){

}


function enterBedroom() {
	if !instance_exists(obj_player) {
		instance_create_layer(8*global.tile_size, 3*global.tile_size, "BGInstances", obj_player);
		show_debug_message("spawned player obj in bedroom");
	}
	
	obj_player.equipped_item = noone;
	obj_player.unlock();

	obj_player.x = 8*global.tile_size;
	obj_player.y = 3*global.tile_size;

	global.phase = "REAL WORLD";
	Save("player1");
}

function enterBasement() {
	global.phase = "DREAMLANDS";
	if !instance_exists(obj_player) {
		instance_create_layer(8*global.tile_size, 13*global.tile_size, "BGInstances", obj_player);
	}
	if !instance_exists(obj_demon_basement_manager) {
		instance_create_layer(0,0,"Collision", obj_demon_basement_manager);
	}
	obj_player.x = 8*global.tile_size;
	obj_player.y = 13*global.tile_size;

	obj_player.visible = true;
	obj_player.speed = 0;
	obj_player.image_speed = 0;
	obj_player.moving = false;
	Save("player1");
}


function enterSchool() {
	room_set_persistent(BackAtSchool, true);
	global.phase = "DREAMLANDS";
	
	if !instance_exists(obj_player) {
		instance_create_layer(5*global.tile_size, 5*global.tile_size, "BGInstances", obj_player);
	}
	obj_player.x = 5*global.tile_size;
	obj_player.y = 5*global.tile_size;

	obj_player.visible = true;
	obj_player.speed = 0;
	obj_player.image_speed = 0;
	obj_player.moving = false;
	Save("player1");
}

function wakeUp() {
	obj_player.should_wake = false;
	room_persistent = false;
	obj_player.bodyparts = obj_player.default_bodyparts;
	obj_player.bodyparts_hp = [2,2,2,2,2,2];
	obj_player.dreamlands_items = [];
	room_goto(Cutscene_WakeUp);
}