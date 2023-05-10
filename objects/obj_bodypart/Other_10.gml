/// @description Insert description here
// You can write your code in this editor
if (obj_dm.phase == "CLAIM_BP") {
	var bp_index = 0;
	for (var scan=0;scan<array_length(obj_dm.player2.bodyparts);scan++) {
		if (obj_dm.player2.bodyparts[scan] == self.id) {
			bp_index = scan;
		}
	}
	
	obj_player.gainBP(bp_index, self.index_number);
}