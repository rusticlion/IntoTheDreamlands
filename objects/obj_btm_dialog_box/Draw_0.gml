/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_btm_dialog_box, 0, 0, 112);
draw_set_color(c_black);
draw_set_font(KenneyMini);
draw_text_ext(x+margin, y+margin, string_copy(texts[textIndex], 1, typewriterProgress), 10, 230);