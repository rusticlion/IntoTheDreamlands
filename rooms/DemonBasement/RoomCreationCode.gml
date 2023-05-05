if !instance_exists(obj_player) {
	instance_create_layer(8*global.tile_size, 13*global.tile_size, "BGInstances", obj_player);
}
obj_player.x = 8*global.tile_size;
obj_player.y = 13*global.tile_size;

obj_player.visible = true;
obj_player.speed = 0;
obj_player.image_speed = 0;
obj_player.moving = false;

room_persistent = true;