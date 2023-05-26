/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_012_a_posture;
b_sprite = spr_card_012_b_pounce;

side_a = instance_create_layer(0,0, "Overlay", obj_card_012_a_posture);
side_b = instance_create_layer(0,0, "Overlay", obj_card_012_b_pounce);

upside = side_a;

hover_text_a = "Mantis flies in the storm.";
hover_text_b = "Mantis lightning strikes.";

hover_text = hover_text_a;
index_number = 12;