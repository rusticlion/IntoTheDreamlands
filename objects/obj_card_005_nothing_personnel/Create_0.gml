/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_005_a_smirk;
b_sprite = spr_card_005_b_behind_you;

side_a = instance_create_layer(0,0, "Overlay", obj_card_005_a_smirk);
side_b = instance_create_layer(0,0, "Overlay", obj_card_005_b_behind_you);

upside = side_a;

hover_text_a = "You may have noticed: I'm not all there myself.";
hover_text_b = "No one plays fair if they think they can get away with it.";

hover_text = hover_text_a;
index_number = 5;