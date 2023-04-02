/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_013_a_savagery;
b_sprite = spr_card_013_b_divebomb;

side_a = instance_create_layer(0,0, "Pieces", obj_card_013_a_savagery);
side_b = instance_create_layer(0,0, "Pieces", obj_card_013_b_divebomb);

upside = side_a;

hover_text_a = "The cornered beast\nis deadliest.";
hover_text_b = "Winged death, sky-tyrant.";

hover_text = hover_text_a;
index_number = 13;