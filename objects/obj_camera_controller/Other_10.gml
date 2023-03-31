/// @description Pan to other view
// You can write your code in this editor

if (panning = "done") {
	if (camera_get_view_y(view_camera) == 320) {
		panning = "up";
		alarm[0] = 20;
	} else {
		panning = "down";
		camera_set_view_speed(view_camera[0], 0, 16);
		alarm[0] = 20;
	}
}