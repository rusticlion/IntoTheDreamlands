/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_016_a_scratch;
b_sprite = spr_card_016_b_seize;

side_a = instance_create_layer(0,0, "Overlay", obj_card_016_a_scratch);
side_b = instance_create_layer(0,0, "Overlay", obj_card_016_b_seize);

upside = side_a;

hover_text_a = "Raking claws reek of infection.";
hover_text_b = "Clumsy fingers, iron grip.";

hover_text = hover_text_a;
index_number = 16;