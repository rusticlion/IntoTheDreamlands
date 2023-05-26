/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_011_a_bone_crush;
b_sprite = spr_card_011_b_rattle;

side_a = instance_create_layer(0,0, "Overlay", obj_card_011_a_bone_crush);
side_b = instance_create_layer(0,0, "Overlay", obj_card_011_b_rattle);

upside = side_a;

hover_text_a = "Unnatural strength.";
hover_text_b = "It skitters, it clatters, it unnerves.";

hover_text = hover_text_a;
index_number = 11;