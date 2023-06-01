/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_039_a_gleaming_plate;
b_sprite = spr_card_039_b_dented_iron;

side_a = instance_create_layer(0,0, "Overlay", obj_card_039_a_gleaming_plate);
side_b = instance_create_layer(0,0, "Overlay", obj_card_039_b_dented_iron);

upside = side_a;

hover_text_a = "Light flashes betwixt blade and armor.";
hover_text_b = "Battered, but not yet bested.";

hover_text = hover_text_a;
index_number = 39;