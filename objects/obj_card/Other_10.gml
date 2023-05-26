/// @description Flip
// You can write your code in this editor

if a_side_up {
	a_side_up = !a_side_up;
	sprite_index = b_sprite;
	hover_text = hover_text_b;
	upside = side_b;
} else {
	a_side_up = !a_side_up;
	sprite_index = a_sprite;
	hover_text = hover_text_a;
	upside = side_a;
}
if instance_exists(obj_dm) {
	controller.refreshDicePool();
}
