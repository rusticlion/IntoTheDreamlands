/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_032_do_nothing;
b_sprite = a_sprite;

side_a = instance_create_layer(0,0, "Overlay", obj_card_032_a_do_nothing);
side_b = instance_create_layer(0,0, "Overlay", obj_card_032_a_do_nothing);

upside = side_a;

hover_text_a = "Entirely inanimate.";
hover_text_b = hover_text_a;

hover_text = hover_text_a;
index_number = 32;