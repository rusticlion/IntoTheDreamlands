/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_044_a_tackle;
b_sprite = spr_card_044_b_twist;

side_a = instance_create_layer(0,0, "Overlay", obj_card_044_a_tackle);
side_b = instance_create_layer(0,0, "Overlay", obj_card_044_b_twist);

upside = side_a;

hover_text_a = "An enthuistic, if imprecise, body slam.";
hover_text_b = "A little distance makes a big difference.";

hover_text = hover_text_a;
index_number = 44;