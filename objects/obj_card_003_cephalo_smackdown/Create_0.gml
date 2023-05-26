/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_003_a_dread_lash;
b_sprite = spr_card_003_b_mollusk_mash;

side_a = instance_create_layer(0,0, "Overlay", obj_card_003_a_dread_lash);
side_b = instance_create_layer(0,0, "Overlay", obj_card_003_b_mollusk_mash);

upside = side_a;

hover_text_a = "Tentacles like a living nest of serpents.";
hover_text_b = "The giant head smashes down!";

hover_text = hover_text_a;
index_number = 3;