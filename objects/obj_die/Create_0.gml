/// @description Insert description here
// You can write your code in this editor
if (shows == noone) {
	shows = irandom(5)+1;
}
target_value = shows;

hover_text = "A prototype die.\nWhoops!."

needsNextFace = true;
locked = false;
fading = false

lock = function() {
	locked = true;	
}

unlock = function() {
	locked = false;	
}

fade = function() {
	fading = true;
}

updateValue = function(new_value) {
	target_value = new_value;
}