/// @description Insert description here
// You can write your code in this editor
event_inherited();
opp_hp_total_when_cast = 42;
getDice = function(controller = noone) {
	opp_hp_total_when_cast = controller.opponent.hp_total();
	var pool = [];
	if (controller) {
		repeat (2) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die);
			array_push(pool, attack_die);
		}
		repeat (1) {
			red_die = instance_create_layer(0, 0, "Pieces", obj_red_die);
			array_push(pool, red_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	if (card.controller.opponent.hp_total() < opp_hp_total_when_cast) {
		card.controller.opponent.addEffect(obj_eff_zombie_infection);
	}
}

checkFlipCondition = function(card) {
	if (card.controller.opponent.hp_total() >= 2*array_length(card.controller.opponent.bodyparts))
	{
		with(card) { event_user(0) }
	}
}