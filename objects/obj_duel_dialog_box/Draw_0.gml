/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(KenneyMini);

switch(obj_dm.game_view) {
	case "home":
		draw_text_ext(58, 422, text, 10, 230);
	break;
	case "away":
		draw_text_ext(8, 10, text, 10, 230);
	default:
		draw_text_ext(58, 422, text, 10, 230);
	break;
}