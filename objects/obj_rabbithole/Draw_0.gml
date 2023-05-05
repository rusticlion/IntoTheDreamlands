/// @description Insert description here
// You can write your code in this editor

draw_self();

for(var i=0;i<array_length(rows_to_colorize);i++) {
	show_debug_message("drawing rabbit hole")
	var row = rows_to_colorize[i];
	for (var j=row.x_start;j<=row.x_end;j++) {
		var roll = irandom(2);
		show_debug_message("coloring"+string(roll))
		var color = noone;
		if roll == 0 {
			color = c_red;
		} else if roll == 1 {
			color = c_green;
		} else {
			color = c_blue;
		}
		draw_point_color(x+j,y+row.height,color);
		if (j == row.x_end) {
			show_debug_message("last pass");	
		}
	}
}
