/// @description Insert description here
// You can write your code in this editor
bodypart_cursor = 0;
show_debug_message("printing camera offset");
x_offset = camera_get_view_x(view_camera[0]);
y_offset = camera_get_view_y(view_camera[0]);

mouse_cursor = instance_create_layer(mouse_x, mouse_y, "MenuOverlay", obj_mouse_cursor);
dialog_box = instance_create_layer(x_offset+6, y_offset+global.tile_size*6+8, "MenuOverlay", obj_menu_dialog);
bodyparts = [];
deck = [];
for (var i = 0; i < 6; i++) {
	
show_debug_message($"{obj_player.bodyparts[i]} {global.bodypart_index[obj_player.bodyparts[i]]}");
	var bp = instance_create_layer(
		x_offset+(13*global.tile_size)+2,
		y_offset+(i*global.tile_size)+2, //magic number p1_y_offset
		"MenuOverlay",
		global.bodypart_index[obj_player.bodyparts[i]],
		{
			controller: obj_player
		}
	);
	bp.hp = obj_player.bodyparts_hp[i];
	show_debug_message(bp.hp);
	array_push(bodyparts, bp);
	
	var card_a = instance_create_layer(-100, -100, "MenuOverlay", global.card_index[bp.index_number])
	var card_b = instance_create_layer(-100, -100, "MenuOverlay", global.card_index[bp.index_number])
	with(card_b) {
		event_user(0);	
	}
	array_push(deck, {a:card_a, b:card_b});
}

closeMenu = function() {
	for (var i = 0; i < 6; i++) {
		instance_destroy(bodyparts[i]);
		instance_destroy(deck[i].a);
		instance_destroy(deck[i].b);
	}
	instance_destroy(obj_menu_dialog);
	instance_destroy(obj_mouse_cursor);
	obj_pause_menu.unlock();
	instance_destroy();	
}

selectedBodypart = function() {
	return bodyparts[bodypart_cursor];	
}

moveToSlotA = function(card) {
	instance_activate_object(card);
	card.x = x_offset+(2*global.tile_size)+2;
	card.y = y_offset+global.tile_size+2;
}

moveToSlotB = function(card) {
	instance_activate_object(card);
	card.x = x_offset+(7*global.tile_size)+2;
	card.y = y_offset+(2*global.tile_size)+2;
}

placeSelectedCardInSlots = function() {
	instance_deactivate_object(obj_card);
	var both_sides = deck[bodypart_cursor];
	moveToSlotA(both_sides.a);
	moveToSlotB(both_sides.b);
}

moveToSlotA(deck[bodypart_cursor].a);
moveToSlotB(deck[bodypart_cursor].b);