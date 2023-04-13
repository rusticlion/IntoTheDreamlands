/// @description Insert description here
// You can write your code in this editor
++char_cursor;
switch(stanza) {
	case 1:
		if (char_cursor > string_length(stanza1[line_cursor])) {
			char_cursor = 1;
			line_cursor += 1;
		}
		if (line_cursor >= array_length(stanza1)) {
			showStanza2();
		}
		var next_letter = string_char_at(stanza1[line_cursor], char_cursor);
		show_debug_message(stanza1[line_cursor]+" "+string(char_cursor)+" "+next_letter)
		var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,line_cursor*global.tile_size,next_letter)[0];
		array_push(displayed_characters, new_letter_tile);
	break;
	case 2:
		if (char_cursor > string_length(stanza2[line_cursor])) {
			char_cursor = 1;
			line_cursor += 1;
		}
		if (line_cursor < array_length(stanza2)) {
			var next_letter = string_char_at(stanza2[line_cursor], char_cursor);
			show_debug_message(stanza2[line_cursor]+" "+string(char_cursor)+" "+next_letter)
			var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,(line_cursor+5)*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			waitForStanza3();
		}
	break;
	case 3:
		if (char_cursor > string_length(stanza3[line_cursor])) {
			char_cursor = 1;
			line_cursor += 1;
		}
		if (line_cursor < array_length(stanza3)) {
			var next_letter = string_char_at(stanza3[line_cursor], char_cursor);
			show_debug_message(stanza3[line_cursor]+" "+string(char_cursor)+" "+next_letter)
			var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,(line_cursor)*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			waitForDeep();
		}
	break;
	case "DEEP":
		var next_letter = string_char_at(l13, char_cursor);
		if (char_cursor <= string_length(l13)) {
			var new_letter_tile = letter_drawing((char_cursor+1)*global.tile_size,7*global.tile_size,next_letter, {color: c_blue})[0];
			array_push(displayed_characters, new_letter_tile);
		} else if (array_length(displayed_characters)<100) {
			waitForWeep();
			char_cursor = 0;
		}
	break;
	case "WEEP":
		var next_letter = string_char_at(l14, char_cursor);
		if (char_cursor <= string_length(l14)) {
			var new_letter_tile = letter_drawing((char_cursor)*global.tile_size,8*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else if (array_length(displayed_characters)<100) {
			waitForStanza4();
			char_cursor = 0;
		}
	break;
	case 4:
		if (char_cursor > string_length(stanza4[line_cursor])) {
			char_cursor = 1;
			line_cursor += 1;
		}
		if (line_cursor < array_length(stanza4)) {
			var next_letter = string_char_at(stanza4[line_cursor], char_cursor);
			show_debug_message(stanza4[line_cursor]+" "+string(char_cursor)+" "+next_letter)
			var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,(line_cursor)*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			showStanza5();
		}
	break;
	case 5:
		if (char_cursor > string_length(stanza5[line_cursor])) {
			char_cursor = 1;
			line_cursor += 1;
		}
		if (line_cursor < array_length(stanza5)) {
			var next_letter = string_char_at(stanza5[line_cursor], char_cursor);
			show_debug_message(stanza5[line_cursor]+" "+string(char_cursor)+" "+next_letter)
			var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,(line_cursor+5)*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			waitForStanza6();
		}
	break;
	case 6:
		if (char_cursor > string_length(stanza6[line_cursor])) {
			char_cursor = 1;
			line_cursor += 1;
		}
		if (line_cursor < array_length(stanza6)) {
			var next_letter = string_char_at(stanza6[line_cursor], char_cursor);
			show_debug_message(stanza6[line_cursor]+" "+string(char_cursor)+" "+next_letter)
			var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,(line_cursor)*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			waitForAttribution();
		}
	break;
	case "ATTRIBUTION":
		var next_letter = string_char_at(attribution, char_cursor);
		if (char_cursor <= string_length(attribution)) {
			var new_letter_tile = letter_drawing((char_cursor-2)*global.tile_size,10*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else if (array_length(displayed_characters) < 100) {
			char_cursor = 0;
		} else {
			waitForInterview();
		}
	break;
	case "INTERVIEW_1":
		show_debug_message(string(interview1)+" "+string(char_cursor));
		var next_letter = string_char_at(interview1, char_cursor);
		if (char_cursor <= string_length(interview1)) {
			var new_letter_tile = letter_drawing((char_cursor)*global.tile_size,9*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			waitForPlayerName();
		}
	break;
	case "INTERVIEW_2":
		show_debug_message(string(interview2)+" "+string(char_cursor));
		var next_letter = string_char_at(interview2, char_cursor);
		if (char_cursor <= string_length(interview2)) {
			var new_letter_tile = letter_drawing((char_cursor)*global.tile_size,9*global.tile_size,next_letter)[0];
			array_push(displayed_characters, new_letter_tile);
		} else {
			waitForPlayerCatName();
		}
	break;
	default:
	
	break;
}