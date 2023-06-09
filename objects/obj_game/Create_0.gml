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

// randomize or don't
randomize();

// set up user interface flags
dialog_active = false;
