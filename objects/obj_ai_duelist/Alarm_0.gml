/// @description Twice a second
// You can write your code in this editor
if (array_length(move_queue)>0) {
	var move_to_perform = array_first(move_queue);
	var temp = [];
	array_copy(temp,0,move_queue, 1,array_length(move_queue)-1);
	move_queue = temp;
	
	move_to_perform.die.x = move_to_perform.slot.x;
	move_to_perform.die.y = move_to_perform.slot.y;
	move_to_perform.slot.apply(move_to_perform.die);
}

if obj_dm.phase == "CLASH" {
	alarm[0] = 15;
}