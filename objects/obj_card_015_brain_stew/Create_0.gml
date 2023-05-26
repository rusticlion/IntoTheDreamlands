/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_015_a_cannibal;
b_sprite = spr_card_015_b_viral_bite;

side_a = instance_create_layer(0,0, "Overlay", obj_card_015_a_cannibal);
side_b = instance_create_layer(0,0, "Overlay", obj_card_015_b_viral_bite);

upside = side_a;

hover_text_a = "I've lost my mind. Give me yours.";
hover_text_b = "One bite is all it takes.";

hover_text = hover_text_a;
index_number = 15;