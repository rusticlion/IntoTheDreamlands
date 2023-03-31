/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_010_a_gold_slam;
b_sprite = spr_card_010_b_opulence;

side_a = instance_create_layer(0,0, "Pieces", obj_card_010_a_gold_slam);
side_b = instance_create_layer(0,0, "Pieces", obj_card_010_b_opulence);

upside = side_a;

hover_text_a = "The weight of riches.";
hover_text_b = "Such resplendence\nas to defy the eye.";

hover_text = hover_text_a;
index_number = 10;