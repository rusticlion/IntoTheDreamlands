/// @description Draggable "drop" interface
// Should only get called in Metatools mgmt menu

obj_mouse_cursor.holding = noone;
var dest = nearestGridCoordinates();
x = dest.xx;
y = dest.yy;