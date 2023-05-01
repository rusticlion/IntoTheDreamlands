/// @description Insert description here
// You can write your code in this editor
sample_text = [
	"Dark days and darker nights.\nYour dreams have turned",
	"strange and frightening.",
	"You while away your time...\naway it goes.",
	"But one day..."
]

choices = [
	"Love",
	"Hate",
	"Fate"
]

instance_create_layer(x, y, "Overlay", obj_dialog, {pages: sample_text, choices: choices});