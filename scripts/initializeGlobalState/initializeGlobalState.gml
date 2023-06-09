// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initializeGlobalState(){
  // no function: GameMaker scripts run before any other assets
  // are loaded, so we're loading empty defaults to all the global
  // state variables here.
}

global.bodypart_index = [
obj_bodypart,
obj_bp001_beast_claw,
obj_bp002_tentacle,
obj_bp003_massive_eye,
obj_bp004_drake_head,
obj_bp005_cheshire_face,
obj_bp006_demon_skull,
obj_bp007_fleshy_mantle,
obj_bp008_broad_shoulders,
obj_bp009_hollow_ribcage,
obj_bp010_jeweled_belly,
obj_bp011_bare_bones,
obj_bp012_mantis_arm,
obj_bp013_leathery_wing,
obj_bp014_rotting_ribcage,
obj_bp015_brain_pan,
obj_bp016_dead_arm,
obj_bp017_shambling_leg,
obj_bp018_hook_for_a_hand,
obj_bp019_cleaver_arm,
obj_bp020_welding_mask,
noone, //obj_bp_021
noone, //obj_bp_022
noone, //obj_bp_023
noone, //obj_bp_024
noone, //obj_bp_025
noone, //obj_bp_026
noone, //obj_bp_027
noone, //obj_bp_028
noone, //obj_bp_029
noone, //obj_bp_030
noone, //obj_bp_031
obj_bp032_straw_leg,
obj_bp033_straw_arm,
obj_bp034_stuffed_sack,
obj_bp035_bucket_head,
obj_bp036_flailing_arm, //obj_bp_036
obj_bp037_stick_arm, //obj_bp_037
obj_bp038_stick_leg, //obj_bp_038
obj_bp039_plated_breast, //obj_bp_039
obj_bp040_iron_helm, //obj_bp_040
obj_bp041_buzzsaw_arm, //obj_bp_041
obj_bp042_average_arm,
obj_bp043_standard_leg,
obj_bp044_typical_torso,
obj_bp045_your_head
]

global.card_index = [
obj_card,
obj_card_001_beast_cutting,
obj_card_002_tentacle_lashing,
obj_card_003_cephalo_smackdown,
obj_card_004_fire_and_fang,
obj_card_005_nothing_personnel,
obj_card_006_speaking_demon,
obj_card_007_squid_fu,
obj_card_008_pankration,
obj_card_009_bone_dancer,
obj_card_010_hoard_beast,
obj_card_011_skeltal,
obj_card_012_mantis_style,
obj_card_013_vicious_raptor,
obj_card_014_shamble_on,
obj_card_015_brain_stew,
obj_card_016_stumbling_scratch,
obj_card_017_septic_shuffle,
obj_card_018_the_hyook,
obj_card_019_chop_suey,
obj_card_020_corpse_smith,
noone,
noone,
noone,
noone,
noone,
noone,
noone,
noone,
noone,
noone,
noone,
obj_card_032_nothing_doing,
obj_card_032_nothing_doing,
obj_card_032_nothing_doing,
obj_card_032_nothing_doing,
obj_card_036_flailed_out,
obj_card_032_nothing_doing,
obj_card_032_nothing_doing,
obj_card_039_knight_moves,
obj_card_040_helmet_hero,
obj_card_041_buzz_cut,
obj_card_042_boxing,
obj_card_043_footwork,
obj_card_044_core_strength,
obj_card_045_situational_awareness
]

global.gadget_index = [
obj_gadget,
obj_red_lever,
obj_green_lever,
obj_blue_lever,
obj_red_injector,
obj_green_injector,
obj_blue_injector,
obj_red_pushbutton,
obj_green_pushbutton,
obj_blue_pushbutton,
obj_red_catalyst_crystal,
obj_green_catalyst_crystal,
obj_blue_catalyst_crystal,
obj_swapper,
obj_decision_lever
]

global.item_index = [
noone,
obj_item001_esoterica,
obj_item002_shovel,
obj_item003_devils_brush,
obj_item004_blindfold,
obj_item005_key,
obj_item006_wrench,
obj_item007_bolt_cutters
]


global.equipped_bodyparts = [];
global.equipped_gadgets = [];
global.unlocked_gadgets = [];
global.duel_parameters = {
	fight_room: Bedroom,
	victoryHandler: function(){}
}

  // config options: these should really be loaded as part of "Game"
  // when I get around to saving and loading them
global.endless_mode = false;
global.mouse_enabled = true;
global.fullscreen = false;
global.devmode = true; // convenience features for bypassing puzzles

global.tile_size = 16;
global.dreamforms_unlocked = ["BASIC PERSON", "MANTIS SENSEI"];
global.realworld_items = [];
global.dreamlands_items = [];