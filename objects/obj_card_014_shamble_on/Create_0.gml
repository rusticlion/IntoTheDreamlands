/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_014_a_lurch;
b_sprite = spr_card_014_b_lunch;

side_a = instance_create_layer(0,0, "Overlay", obj_card_014_a_lurch);
side_b = instance_create_layer(0,0, "Overlay", obj_card_014_b_lunch);

upside = side_a;

hover_text_a = "A creaking, cracking skitter on twisted, broken bones.";
hover_text_b = "Time for a snack.";

hover_text = hover_text_a;
index_number = 14;