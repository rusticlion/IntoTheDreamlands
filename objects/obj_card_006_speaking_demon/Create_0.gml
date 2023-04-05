/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_006_a_curse;
b_sprite = spr_card_006_b_prophet;

side_a = instance_create_layer(0,0, "Pieces", obj_card_006_a_curse);
side_b = instance_create_layer(0,0, "Pieces", obj_card_006_b_prophet);

upside = side_a;

hover_text_a = "Burn and wither and rot\nand die.";
hover_text_b = "Your story is over.";

hover_text = hover_text_a;
index_number = 6;