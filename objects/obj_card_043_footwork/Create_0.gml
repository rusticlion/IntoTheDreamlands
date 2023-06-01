/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_043_a_kick;
b_sprite = spr_card_043_b_juke;

side_a = instance_create_layer(0,0, "Overlay", obj_card_043_a_kick);
side_b = instance_create_layer(0,0, "Overlay", obj_card_043_b_juke);

upside = side_a;

hover_text_a = "Like a punch with your foot...you guess.";
hover_text_b = "Speed is armor.";

hover_text = hover_text_a;
index_number = 43;