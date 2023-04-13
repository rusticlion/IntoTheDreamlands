/// @description Set stuff at random for flicker effect

var bobble_vertical = 1-irandom(2);
var bobble_horizontal = 1-irandom(2);

x = clamp(x+bobble_horizontal, x_origin-2, x_origin+2);
y = clamp(y+bobble_vertical, y_origin-2, y_origin+2);

x = clamp(x,0,224);
y = clamp(y,0,144);

image_index = irandom(2);

alarm[0] = irandom(30)+1;