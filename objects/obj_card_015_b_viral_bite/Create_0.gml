/// @description Insert description here
// You can write your code in this editor
event_inherited();
opp_hp_total_when_cast = 42;
getDice = function(controller = noone) {
	opp_hp_total_when_cast = controller.opponent.hp_total();
	show_debug_message($"Viral Bite rolled a pool with enemy at {opp_hp_total_when_cast }");
	var pool = [];
	if (controller) {
		repeat (1) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_red_die, {live: false, shows: 6});
			array_push(pool, attack_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	show_debug_message($"Viral Bitewent to cleanup with enemy at {card.controller.opponent.hp_total()}");
	if (card.controller.opponent.hp_total() < opp_hp_total_when_cast) {
		card.controller.opponent.addEffect(obj_eff_zombie_infection);
	}
}

checkFlipCondition = function(card) {
	if (card.controller.opponent.hp_total() < 2*array_length(card.controller.opponent.bodyparts))
	{
		with(card) {
			event_user(0);
		}
	}
}