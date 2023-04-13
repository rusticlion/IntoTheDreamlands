/// @description Initialize runtime settings and constants
// configure window
window_set_cursor(cr_none);
if !window_get_fullscreen()
{
    window_center();
}
window_set_size(480, 320);
window_set_caption("it's just a dream")

// set up globals
global.tile_size = 16;
global.dreamforms_unlocked = ["BEAST MAN", "MANTIS SENSEI"];
randomize();
