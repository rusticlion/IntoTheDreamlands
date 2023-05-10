/// @description Insert description here
// You can write your code in this editor
if (phase == "POST_DUEL") {
	room_goto(Bedroom);
} else if (phase == "LOSS") {
	room_goto(Bedroom);
} else if (phase == "TIE") {
	room_goto(Bedroom);	
}