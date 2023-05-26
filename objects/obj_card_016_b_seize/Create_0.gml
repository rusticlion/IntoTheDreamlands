/// @description Insert description here
// You can write your code in this editor
event_inherited();
getDice = function(controller = noone) {
	var pool = [];
	if (controller) {
		repeat (1) {
			attack_die = instance_create_layer(0, 0, "Pieces", obj_blk_die, {live: false, shows: 5});
			array_push(pool, attack_die);
		}
	}
	return pool;
}

cleanupEffect = function(card) {
	card.controller.modify_r_factor(1);
}

checkFlipCondition = function(card) {
	if (!card.controller.opponent.hasEffect(obj_eff_zombie_infection))
	{
		with(card) { event_user(0) }
	}
}