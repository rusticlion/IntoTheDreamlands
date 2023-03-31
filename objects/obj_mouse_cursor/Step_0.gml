/// @description Insert description here
// You can write your code in this editor
upper_bound = 0;
lower_bound = 0;
switch(obj_dm.game_view) {
	case "home":
		upper_bound = 320;
		lower_bound = 464;
	break;
	case "away":
		upper_bound = 0;
		lower_bound = 144;
	break;
	case "clash":
		upper_bound = 160;
		lower_bound = 304;
	break;
	default:
		obj_debug_duck.visible = true;
		obj_debug_duck.color = c_purple;
	break;
}

if (ready) {
	if keyboard_check(vk_right) {
		readyTimer();
		x = clamp(x + 16, 0, 224);
		}
	else if keyboard_check(vk_up) {
		readyTimer();
		y = clamp(y - 16, upper_bound, lower_bound);
		}
	else if keyboard_check(vk_left) {
		readyTimer();
		x = clamp(x - 16, 0, 240);
		}
	else if keyboard_check(vk_down) {
		readyTimer();
		y = clamp(y + 16, upper_bound, lower_bound);
		}
	else {
		}
}

if !(holding == "empty") {
	holding.x = x;
	holding.y = y;
}
