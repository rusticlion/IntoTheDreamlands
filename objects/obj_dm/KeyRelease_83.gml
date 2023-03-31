/// @description Insert description here
// You can write your code in this editor
function changeView() {
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	with (_cameraman) {
		event_user(0);
	}

	switch(game_view)
	{
		case "home":
			game_view = "away";
			obj_mouse_cursor.y -= 320
		break;
		case "away":
			game_view = "home";
			obj_mouse_cursor.y += 320
		break;
		default:
		break;
	}
}

changeView();