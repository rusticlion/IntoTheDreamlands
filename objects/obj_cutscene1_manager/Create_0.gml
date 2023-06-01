/// @description Insert description here
// You can write your code in this editor
stanza = 0;
char_cursor = 0;
line_cursor = 0;
displayed_characters = [];

l1 = "I STAND AMID"
l2 = "THE ROAR"
l3 = "OF A SURF"
l4 = "TORMENTED SHORE"

l5 = "AND I HOLD"
l6 = "WITHIN MY HAND"
l7 = "GRAINS OF THE"
l8 = "GOLDEN SAND -"

l9 = "HOW FEW! YET"
l10 = "HOW THEY CREEP"
l11 = "THROUGH MY"
l12 = "FINGERS TO THE"

l13 = "DEEP"
l14 = "WHILE I WEEP!"
// while i weep...

l15 = "O GOD! CAN I"
l16 = "NOT GRASP"
l17 = "THEM WITH A"
l18 = "TIGHTER CLASP?"

l19 = "O GOD! CAN I"
l20 = "NOT SAVE"
l20a = "ONE"
l21 = "FROM THE"
l22 = "PITILESS WAVE?"

l23 = "IS"
l23a = "ALL"
l23b = "THAT WE" 
l24 = "SEE OR SEEM"
l25 = "BUT A DREAM"
l26 = "WITHIN A DREAM?";

attribution = "EDGAR ALLAN POE"

interview1 = "YOUR NAME?"

interview2 = "CAT'S NAME?"

interview3 = "WHO ARE YOU?"

stanza1 = [l1,l2,l3,l4]
stanza2 = [l5,l6,l7,l8]

stanza3 = [l9,l10,l11,l12]

stanza4 = [l15, l16, l17, l18]
stanza5 = [l19, l20, l20a, l21, l22]
stanza6 = [l23, l23a, l23b, l24, l25, l26]

clearText = function() {
	for (var i=0;i<array_length(displayed_characters);i++) {
		instance_destroy(displayed_characters[i]);
	}
	displayed_characters = [];
}

showStanza1 = function() {
	stanza = 1;
	char_cursor = 0;
	line_cursor = 0;
}

showStanza2 = function() {
	stanza = 2;
	char_cursor = 0;
	line_cursor = 0;
}

waitForStanza3 = function() {
	stanza = noone;
	click = showStanza3;
}

showStanza3 = function() {
	stanza = 3
	clearText();
	char_cursor = 0;
	line_cursor = 0;
}

waitForDeep = function() {
	stanza = noone
	click = showDeep;
}

showDeep = function() {
	stanza = "DEEP";
	char_cursor = 0;
	line_cursor = 0;
}

waitForWeep = function() {
	stanza = noone
	click = showWeep;
}

showWeep = function() {
	clearText();
	stanza = "WEEP";
	char_cursor = 0;
	line_cursor = 0;
}

waitForStanza4 = function() {
	stanza = noone;
	click = showStanza4;
}

showStanza4 = function() {
	clearText();
	stanza = 4;
	char_cursor = 0;
	line_cursor = 0;
}

showStanza5 = function() {
	stanza = 5;
	char_cursor = 0;
	line_cursor = 0;
}

waitForStanza6 = function() {
	stanza = noone;
	click = showStanza6;
}

showStanza6 = function() {
	clearText();
	stanza = 6;
	char_cursor = 0;
	line_cursor = 0;
}

waitForAttribution = function() {
	stanza = noone;
	click = showAttribution;
}

showAttribution = function() {
	stanza = "ATTRIBUTION";
	char_cursor = 0;
	line_cursor = 0;
}

waitForInterview = function() {
	stanza = noone;
	click = showInterview1;
}

showInterview1 = function() {
	clearText();
	char_cursor = 0;
	line_cursor = 0;
	show_debug_message("going to interview 1");
	stanza = "INTERVIEW_1";
}

waitForPlayerName = function() {
	stanza = noone;
	keyboard = instance_create_layer(2*global.tile_size, 4*global.tile_size, "Instances", obj_keyboard)
	keyboard.submit = function() {
		if (keyboard.field == "") {
			keyboard.field = keyboard.field_default;
		}
		global.playername = keyboard.field;
		showInterview2();
	}
	keyboard.field_default = "KARL";
	click = click_key;
}

showInterview2 = function() {
	clearText();
	instance_destroy(keyboard);
	char_cursor = 0;
	line_cursor = 0;
	stanza = "INTERVIEW_2";
}

waitForPlayerCatName = function() {
	stanza = noone;
	keyboard = instance_create_layer(2*global.tile_size, 4*global.tile_size, "Instances", obj_keyboard)
	keyboard.submit = function() {
		if (keyboard.field == "") {
			keyboard.field = keyboard.field_default;
		}
		global.player_cat_name = keyboard.field;
		showInterview3();
	}
	keyboard.field_default = "HOWARD";
	click = click_key;
}

showInterview3 = function() {
	clearText();
	instance_destroy(keyboard);
	char_cursor = 0;
	line_cursor = 0;
	stanza = "INTERVIEW_3";
}

waitForPlayerCharSelect = function() {
	stanza = noone;
	char_picker = instance_create_layer(5*global.tile_size, 4*global.tile_size, "Instances", obj_char_picker);
	char_picker.click = function() {
		global.player_sprite = char_picker.cursor;
		endCutscene();
	}
	click = click_character;
}

endCutscene = function() {
	global.dreamforms_unlocked = ["BASIC PERSON"];
	global.realworld_items = [];
	global.dreamlands_items = [];
	global.equipped_bodyparts = [45,44,42,42,43,43]; // index numbers for initial dreamform
	global.equipped_bodyparts_hitpoints = [2, 2, 2, 2, 2, 2]; // full health BPs
	global.saved_x_position = 7*global.tile_size;
	global.saved_y_position = 3*global.tile_size;
	
	room_goto(Bedroom);
}

click = function() {
	// passthrough, update as scene progresses	
}

click_key = function() {
	keyboard.click();	
}

click_character = function() {
	char_picker.click();	
}


showStanza1();