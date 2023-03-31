/// @description Insert description here
// You can write your code in this editor

function changeView() {
	var _cameraman = instance_nearest(x, y, obj_camera_controller);
	with (_cameraman) {
		event_user(0);
	}

	switch(gameView)
	{
		case "home":
			gameView = "away";
			obj_mouse_cursor.y -= 320
		break;
		case "away":
			gameView = "home";
			obj_mouse_cursor.y += 320
		break;
		default:
		break;
	}
}

changeView();