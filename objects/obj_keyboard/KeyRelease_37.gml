/// @description Insert description here
// You can write your code in this editor
if (cursor == 10 || cursor == 20) {
	cursor--;
	x+=global.tile_size*9;
	y-=global.tile_size
} else if (cursor>0) {
	cursor--;
	x-=global.tile_size
}