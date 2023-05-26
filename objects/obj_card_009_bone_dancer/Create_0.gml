/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_009_a_bone_toss;
b_sprite = spr_card_009_b_rise_again;

side_a = instance_create_layer(0,0, "Overlay", obj_card_009_a_bone_toss);
side_b = instance_create_layer(0,0, "Overlay", obj_card_009_b_rise_again);

upside = side_a;

hover_text_a = "The leg bone's connected to the pain bone.";
hover_text_b = "You're never gonna keep me down.";

hover_text = hover_text_a;
index_number = 9;