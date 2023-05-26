/// @description Insert description here
// You can write your code in this editor
event_inherited();

hover_text = "Swap your active card with the top card of your deck. Costs no energy";
pushbuttonEffect = function() {
	var previous_active_card = owner.active_card;
	var previous_next_card = owner.next_card;
	owner.active_card = previous_next_card;
	owner.next_card = previous_active_card;
	obj_dm.p1_active_card_id = array_pop(obj_dm.player1_cards);
	array_push(obj_dm.player1_cards, previous_active_card.index_number);
	var top_of_deck = 
	{ 
		xx: previous_next_card.x,
		yy: previous_next_card.y
	}
	owner.active_card.x = previous_active_card.x;
	owner.active_card.y = previous_active_card.y;
	owner.next_card.x = top_of_deck.xx;
	owner.next_card.y = top_of_deck.yy;
	owner.refreshDicePool();
}


reset = function() {
	sprite_index = spr_swapper;
}