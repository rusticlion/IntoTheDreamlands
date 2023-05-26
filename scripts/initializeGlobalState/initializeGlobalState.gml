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
obj_bp017_shambling_leg
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
obj_card_017_septic_shuffle
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
obj_swapper
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
global.endless_mode = true;
global.mouse_enabled = false;
global.fullscreen = false;