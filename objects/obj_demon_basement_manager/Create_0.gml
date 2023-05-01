/// @description Insert description here

// Set up camera
	camera = view_get_camera(0)
	camera_set_view_speed(camera, 0, 0);

// Set up three pipes
	pipe_alpha = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_a);
	pipe_alpha.x = global.tile_size*3;
	pipe_alpha.y = global.tile_size*10;
	pipe_beta = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_b);
	pipe_beta.x = global.tile_size*11;
	pipe_beta.y = global.tile_size*9
	pipe_delta = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_d);
	pipe_delta.x = global.tile_size*11;
	pipe_delta.y = global.tile_size*11
// Set up three cracks

// Set up spooky spot

// Set up cross

// Set up buckets

// Set up desk

// Set up cutting table

// Set up door