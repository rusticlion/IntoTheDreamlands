/// @description Insert description here

// Set up camera
	camera = view_get_camera(0)
	camera_set_view_speed(camera, 0, 0);

// Set up three pipes
	pipe_alpha = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_a);
	pipe_beta = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_b);
	pipe_delta = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_d);
	var shuffled_pipes = array_shuffle([pipe_alpha, pipe_beta, pipe_delta]);
	
	shuffled_pipes[0].x = global.tile_size*3;
	shuffled_pipes[0].y = global.tile_size*10;
	shuffled_pipes[1].x = global.tile_size*11;
	shuffled_pipes[1].y = global.tile_size*9
	shuffled_pipes[2].x = global.tile_size*11;
	shuffled_pipes[2].y = global.tile_size*11;
	
	pipe_c = instance_create_layer(0,0,"BGInstances",obj_wall_pipe_c);
	pipe_c.x = global.tile_size*3;
	pipe_c.y = global.tile_size*12;
	
// Set up three cracks
	crack_alpha = instance_create_layer(0,0,"FGInstances",obj_cracked_wall_a);
	crack_beta = instance_create_layer(0,0,"FGInstances",obj_cracked_wall_b);
	crack_delta = instance_create_layer(0,0,"FGInstances",obj_cracked_wall_d);
	var shuffled_cracks = array_shuffle([crack_alpha, crack_beta, crack_delta]);
	
	shuffled_cracks[0].x = global.tile_size*6;
	shuffled_cracks[0].y = global.tile_size*6;
	shuffled_cracks[1].x = global.tile_size*7;
	shuffled_cracks[1].y = global.tile_size*6;
	shuffled_cracks[2].x = global.tile_size*8;
	shuffled_cracks[2].y = global.tile_size*6;

// Set up spooky spot

// Set up cross
	cross = instance_create_layer(7*global.tile_size,0,"BGInstances",obj_st_andrews_cross)
// Set up buckets

// Set up desk

// Set up cutting table

// Set up door