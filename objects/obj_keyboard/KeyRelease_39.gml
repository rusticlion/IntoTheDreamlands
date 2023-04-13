/// @description Insert description here
// You can write your code in this editor
if (cursor == 9 || cursor == 19) {
	cursor++;
	x-=global.tile_size*9;
	y+=global.tile_size
}
else if (cursor<29) {
	cursor++;
	x+=global.tile_size;
}