/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_002_a_wet_slap;
b_sprite = spr_card_002_b_octolock;

side_a = instance_create_layer(0,0, "Overlay", obj_card_002_a_wet_slap);
side_b = instance_create_layer(0,0, "Overlay", obj_card_002_b_octolock);

upside = side_a;

hover_text_a = "Surprisingly strong and unsurprisingly slimy.";
hover_text_b = "This attack really sucks.";

hover_text = hover_text_a;
index_number = 2;