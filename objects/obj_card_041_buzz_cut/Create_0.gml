/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_041_a_rip_and_tear;
b_sprite = spr_card_041_b_bludgeon;

side_a = instance_create_layer(0,0, "Overlay", obj_card_041_a_rip_and_tear);
side_b = instance_create_layer(0,0, "Overlay", obj_card_041_b_bludgeon);

hover_text_a = "WHIRRRRRRRRRRRRR";
hover_text_b = "The blade is broken, but continues to flail.";

hover_text = hover_text_a;
index_number = 41;