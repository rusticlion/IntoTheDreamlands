if !instance_exists(obj_player) {
	instance_create_layer(8*global.tile_size, 3*global.tile_size, "BGInstances", obj_player);
	show_debug_message("spawned player obj in bedroom");
}
obj_player.x = 8*global.tile_size;
obj_player.y = 3*global.tile_size;
global.phase = "REAL WORLD";