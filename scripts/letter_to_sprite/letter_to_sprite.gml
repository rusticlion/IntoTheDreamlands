// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
 function letterToSprite(letter) {
	switch(letter) {
		case "A":
			return spr_letter_a;
		break;
		case "B":
			return spr_letter_b;
		break;
		case "C":
			return spr_letter_c;
		break;
		case "D":
			return spr_letter_d;
		break;
		case "E":
			return spr_letter_e;
		break;
		case "F":
			return spr_letter_f;
		break;
		case "G":
			return spr_letter_g;
		break;
		case "H":
			return spr_letter_h;
		break;
		case "I":
			return spr_letter_i;
		break;
		case "J":
			return spr_letter_j;
		break;
		case "K":
			return spr_letter_k;
		break;
		case "L":
			return spr_letter_l;
		break;
		case "M":
			return spr_letter_m;
		break;
		case "N":
			return spr_letter_n;
		break;
		case "O":
			return spr_letter_o;
		break;
		case "P":
			return spr_letter_p;
		break;
		case "Q":
			return spr_letter_q;
		break;
		case "R":
			return spr_letter_r;
		break;
		case "S":
			return spr_letter_s;
		break;
		case "T":
			return spr_letter_t;
		break;
		case "U":
			return spr_letter_u;
		break;
		case "V":
			return spr_letter_v;
		break;
		case "W":
			return spr_letter_w;
		break;
		case "X":
			return spr_letter_x;
		break;
		case "Y":
			return spr_letter_y;
		break;
		case "Z":
			return spr_letter_z;
		break;
		case " ":
			return noone;
		break;
		case "-":
			return spr_letter_dash;
		break;
		case "?":
			return spr_letter_interro;
		break;
		case "!":
			return spr_letter_bang;
		break;
		case "'":
			return spr_letter_apostrophe;
		break;
		default:
			return spr_debug_duck;
		break;
	}
}