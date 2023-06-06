/// @description Insert description here
// You can write your code in this editor
startDream = function() {
	room_list = array_shuffle([DemonBasement, BackAtSchool]);
	target = room_list[0];
	room_goto(target);
}