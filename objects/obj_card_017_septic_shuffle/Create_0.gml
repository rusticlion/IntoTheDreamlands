/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_017_a_stumble;
b_sprite = spr_card_017_b_lunge;

side_a = instance_create_layer(0,0, "Overlay", obj_card_017_a_stumble);
side_b = instance_create_layer(0,0, "Overlay", obj_card_017_b_lunge);

upside = side_a;

hover_text_a = "Jerking, erratic steps, like a hangman's dance.";
hover_text_b = "Rotting tendons snap and spring.";

hover_text = hover_text_a;
index_number = 17;