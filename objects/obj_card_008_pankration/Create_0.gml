/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_008_a_body_slam;
b_sprite = spr_card_008_b_judo_flip;

side_a = instance_create_layer(0,0, "Pieces", obj_card_008_a_body_slam);
side_b = instance_create_layer(0,0, "Pieces", obj_card_008_b_judo_flip);

upside = side_a;

hover_text_a = "From the top ropes!";
hover_text_b = "They are the mountain:\nyou are the sea.";

hover_text = hover_text_a;
index_number = 8;