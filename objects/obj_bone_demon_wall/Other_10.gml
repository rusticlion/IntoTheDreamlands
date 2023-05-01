/// @description Insert description here
// You can write your code in this editor
if (unrevealed && obj_player.hasItem(obj_item_shovel)) {
	dialog = createDialog(
		"The earth looks loose here. Dig with your shovel?",
		["YES", "NO"]
	)
	dialog.handler = function(dialog_ref) {
		switch(dialog_ref.choice) {
			case "YES":
				sprite_index = spr_debug_duck;

			break;
			case "NO":
				sprite_index = spr_blood_buckets;
			break;
			default:
				show_debug_message("Dialog box got an invalid choice :(");
			break;
		}
	}
}