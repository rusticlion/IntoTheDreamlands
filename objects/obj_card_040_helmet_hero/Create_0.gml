/// @description Insert description here
// You can write your code in this editor
event_inherited();

a_sprite = spr_card_040_a_iron_gaze;
b_sprite = spr_card_040_b_helmet_bash;

side_a = instance_create_layer(0,0, "Overlay", obj_card_040_a_iron_gaze);
side_b = instance_create_layer(0,0, "Overlay", obj_card_040_b_helmet_bash);

upside = side_a;

hover_text_a = "Something inhuman peers from behind that visor.";
hover_text_b = "Unexpectedly brutal.";

hover_text = hover_text_a;
index_number = 40;