/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_018_a_parry;
b_sprite = spr_card_018_b_impale;

side_a = instance_create_layer(0,0, "Overlay", obj_card_018_a_parry);
side_b = instance_create_layer(0,0, "Overlay", obj_card_018_b_impale);

upside = side_a;

hover_text_a = "The glinting tip of the hook darts like a dragonfly.";
hover_text_b = "The insides are outside.";

hover_text = hover_text_a;
index_number = 17;