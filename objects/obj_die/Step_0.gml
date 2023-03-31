/// @description Insert description here
// You can write your code in this editor
if (live && needsNextFace) {
	alarm[0] = 4;
	shows = irandom(5)+1;
	needsNextFace = false;
}


if ((target_value != shows) && needsNextFace) {
	needsNextFace = false;
	alarm[0] = 4;
	if (target_value < shows) {
		shows -= 1;
	} else {
		shows += 1;	
	}
}