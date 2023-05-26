/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_001_a_swift_slice;
b_sprite = spr_card_001_b_savage_slash;

side_a = instance_create_layer(0,0, "Overlay", obj_card_001_a_swift_slice);
side_b = instance_create_layer(0,0, "Overlay", obj_card_001_b_savage_slash);

upside = side_a;

hover_text_a = "Swift as lightning, sharp  as quartz.";
hover_text_b = "Desperate times call for desperate gambles.";

hover_text = hover_text_a;
index_number = 1;