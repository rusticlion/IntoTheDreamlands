/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_019_a_chop;
b_sprite = spr_card_019_b_frenzy;

side_a = instance_create_layer(0,0, "Overlay", obj_card_019_a_chop);
side_b = instance_create_layer(0,0, "Overlay", obj_card_019_b_frenzy);

upside = side_a;

hover_text_a = "He went out night after night, in search of fresh meat.";
hover_text_b = "Death calls for death. Blood calls for blood.";

hover_text = hover_text_a;
index_number = 19;