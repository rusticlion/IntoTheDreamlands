/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_045_a_headbutt;
b_sprite = spr_card_045_b_think_fast;

side_a = instance_create_layer(0,0, "Overlay", obj_card_045_a_headbutt);
side_b = instance_create_layer(0,0, "Overlay", obj_card_045_b_think_fast);

upside = side_a;

hover_text_a = "Face-to-face combat.";
hover_text_b = "There's nothing like a new plan.";

hover_text = hover_text_a;
index_number = 45;