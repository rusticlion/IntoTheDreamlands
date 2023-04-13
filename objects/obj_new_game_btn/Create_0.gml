/// @description Insert description here
// You can write your code in this editor
active = false;
global.devmode = false;
if (global.devmode) {
	room_goto(Bedroom);
}

click = function() {
	room_goto(Cutscene1_Intro);
}