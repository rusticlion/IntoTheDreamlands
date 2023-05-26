/// @description Initialize runtime settings and constants
// configure window
window_set_cursor(cr_none);

if global.fullscreen {
	window_set_fullscreen(true);
}
if !window_get_fullscreen()
{
    window_center();
}
window_set_size(480, 320);
window_set_caption("Into the Dreamlands - Alpha 0.1")

// set up static globals
global.tile_size = 16;
global.dreamforms_unlocked = ["BEAST MAN", "MANTIS SENSEI"];
global.realworld_items = [];
global.dreamlands_items = [];
// randomize or don't
randomize();
