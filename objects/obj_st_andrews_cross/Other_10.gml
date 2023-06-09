/// @description Insert description here
// You can write your code in this editor
if (state == "BLINDFOLD_PRESENT") {
	buildDialog(state_0_dialog_pages, state_0_dialog_choices, state_0_dialogCallback);
} else {
	buildDialog(state_1_dialog_pages);
}