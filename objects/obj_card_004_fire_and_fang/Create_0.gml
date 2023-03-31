/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_004_a_bite;
b_sprite = spr_card_004_b_fire_breath;

side_a = instance_create_layer(0,0, "Pieces", obj_card_004_a_bite);
side_b = instance_create_layer(0,0, "Pieces", obj_card_004_b_fire_breath);

upside = side_a;

hover_text_a = "Teeth like bloody daggers.";
hover_text_b = "The very furnace of hell.";

hover_text = hover_text_a;
index_number = 4;