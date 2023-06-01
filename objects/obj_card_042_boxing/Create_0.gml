/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_042_a_arm_block;
b_sprite = spr_card_042_b_punch;

side_a = instance_create_layer(0,0, "Overlay", obj_card_042_a_arm_block);
side_b = instance_create_layer(0,0, "Overlay", obj_card_042_b_punch);

upside = side_a;

hover_text_a = "A basic guard, but better than nothing.";
hover_text_b = "Everyone's got a plan until they get punched in the mouth.";

hover_text = hover_text_a;
index_number = 42;