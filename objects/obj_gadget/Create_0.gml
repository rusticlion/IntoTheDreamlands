/// @description Insert description here
// You can write your code in this editor
event_inherited();

reset = function() {
	// passthrough, implement for gadgets
	// should return gadget to its ready state
}

validPlacementCheck = function() {
	var grid_coordinates = nearestGridCoordinates();
	return place_empty(grid_coordinates.xx, grid_coordinates.yy, obj_hoverable);
}

nearestGridCoordinates = function() {
	var grid_x = round(x/global.tile_size)*global.tile_size;
	var grid_y = round(y/global.tile_size)*global.tile_size;
	return {
		xx: grid_x,
		yy: grid_y
	}
}

drawPlacementUnderlay = function() {
	var dest = nearestGridCoordinates();
	if (validPlacementCheck() == true) {
		draw_set_color(c_green);
	} else {
		draw_set_color(c_red);
	}
	draw_rectangle(dest.xx, dest.yy, dest.xx+sprite_width, dest.yy+sprite_width, false);
}