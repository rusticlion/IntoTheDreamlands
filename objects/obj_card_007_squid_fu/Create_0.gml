/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_007_a_ink_jet;
b_sprite = spr_card_007_b_beak_bite;

side_a = instance_create_layer(0,0, "Overlay", obj_card_007_a_ink_jet);
side_b = instance_create_layer(0,0, "Overlay", obj_card_007_b_beak_bite);

upside = side_a;

hover_text_a = "Oh my God! Where did it go?!";
hover_text_b = "Cruelly hooked and razor-sharp.";

hover_text = hover_text_a;
index_number = 7;