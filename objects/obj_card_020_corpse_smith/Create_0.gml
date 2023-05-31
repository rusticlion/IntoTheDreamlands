/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_020_a_faceless;
b_sprite = spr_card_020_b_bloodlust;

side_a = instance_create_layer(0,0, "Overlay", obj_card_020_a_faceless);
side_b = instance_create_layer(0,0, "Overlay", obj_card_020_b_bloodlust);

upside = side_a;

hover_text_a = "I don't want to know what's behind that mask.";
hover_text_b = "These violent delights have violent ends.";

hover_text = hover_text_a;
index_number = 20;