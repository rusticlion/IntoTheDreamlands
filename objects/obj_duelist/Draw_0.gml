/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_set_font(KenneyMini);
if displayed_r < r_factor*50 {
	displayed_r+=5;	
} else if displayed_r > r_factor*50 {
	displayed_r-=5;
}
if displayed_g < g_factor*50 {
	displayed_g+=5;
} else if displayed_g > g_factor*50 {
	displayed_g-=5;	
}
if displayed_b < b_factor*50 {
	displayed_b+=5;
} else if displayed_b > b_factor*50 {
	displayed_b-=5;	
}
if (obj_dm.player1.id == self.id) {
	draw_healthbar(0, 342, 28, 344, displayed_r, c_black, c_red, c_red, 0, false, false);
	draw_healthbar(0, 374, 28, 376, displayed_g, c_black, c_lime, c_lime, 0, false, false);
	draw_healthbar(0, 406, 28, 408, displayed_b, c_black, c_blue, c_blue, 0, false, false);
	for (var i=0;i<blood;i++) {
		if (obj_dm.phase == "PLAN") {
			var board_x_placement = global.tile_size*(9+i), 
			var board_y_placement = global.tile_size*25;
			draw_sprite(spr_heart_point, i, board_x_placement, board_y_placement)
		} else {
			var center_x_placement = global.tile_size*(12+i), 
			var center_y_placement = global.tile_size*18+global.tile_size/2;
			draw_sprite(spr_heart_point, i, center_x_placement, center_y_placement)
		}
	}
	draw_text(2, 289, "R");
	draw_set_color(c_red);
	draw_text(2, 305, string(r_factor));
	draw_set_color(c_white);
	draw_text(18, 289, "G");
	draw_set_color(c_lime);
	draw_text(18, 305, string(g_factor));
	draw_set_color(c_white);
	draw_text(34, 289, "B");
	draw_set_color(c_blue);
	draw_text(34, 305, string(b_factor));
	
	draw_set_color(c_white);
	draw_text(48, 400, string(energy));
} else {
	draw_healthbar(239, 86, 179, 88, r_factor*50, c_black, c_red, c_red, 0, false, false);
	draw_healthbar(239, 118, 179, 120, g_factor*50, c_black, c_lime, c_lime, 0, false, false);
	draw_healthbar(239, 150, 179, 152, b_factor*50, c_black, c_blue, c_blue, 0, false, false);
	for (var i=0;i<blood;i++) {
		if (obj_dm.phase == "PLAN") {
			var board_x_placement = global.tile_size*(3+i), 
			var board_y_placement = global.tile_size*4;
			draw_sprite(spr_heart_point, i, board_x_placement, board_y_placement)
		} else {
			var center_x_placement = global.tile_size*i, 
			var center_y_placement = global.tile_size*10+global.tile_size/2;
			draw_sprite(spr_heart_point, i, center_x_placement, center_y_placement)
		}
	}
	draw_text(194, 162, "R");
	draw_set_color(c_red);
	draw_text(194, 178, string(r_factor));
	draw_set_color(c_white);
	draw_text(210, 162, "G");
	draw_set_color(c_lime);
	draw_text(210, 178, string(g_factor));
	draw_set_color(c_white);
	draw_text(226, 162, "B");
	draw_set_color(c_blue);
	draw_text(226, 178, string(b_factor));
}
