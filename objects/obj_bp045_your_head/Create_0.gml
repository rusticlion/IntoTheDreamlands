/// @description Insert description here
// You can write your code in this editor
hover_text = "YOUR HEAD\n<3<3<3\nUse it or lose it."
blood_value = 3;
toughness = 2;

bp_class = "HEAD";

instinct = obj_card_045_situational_awareness;
index_number = 45;
image_speed = 0;
if global.player_sprite == 0 {
	image_index = 3
} 
base_image_index = image_index;

event_inherited();