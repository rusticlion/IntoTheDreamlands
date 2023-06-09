// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animateRabbithole(pixels){
	for (var i=0;i<array_length(pixels);i++) {
		var p = pixels[i];
		var roll = irandom(2);
		var color = noone;
		switch(roll) {
			case 0:
				color = c_red;
			break;
			case 1:
				color = c_green;
			break;
			case 2:
				color = c_blue;
			break;
			default:
			break;
		}
		draw_point_color(p.xx, p.yy, color)
	}
}

function animateRabbitholeBackground(xx,yy) {
	for(var n=xx;n<xx+16;n++) {
		for (var m=yy;m<yy+16;m++) {
			var roll = irandom(2);
			var color = noone;
			switch(roll) {
				case 0:
					color = c_red;
				break;
				case 1:
					color = c_green;
				break;
				case 2:
					color = c_blue;
				break;
				default:
				break;
			}
			draw_point_color(n, m, color)
		}
	}
}