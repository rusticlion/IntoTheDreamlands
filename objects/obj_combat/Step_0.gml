/// @description Insert description here
// You can write your code in this editor
if (state == "DONE") {
	if (room == originating_room) {
		postCombat();
		instance_destroy(self);
	}
}