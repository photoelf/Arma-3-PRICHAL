/* ----------------------------------------------------------------------------
Function: BLWK_fnc_addPlayerItems

Description:
	Adds a number of potential items to a player based on mission params.

	Executed from "initPlayerLocal.sqf" & "onPlayerRespawn.sqf"

Parameters:
	0: _player : <OBJECT> - The person to add items to

Returns:
	NOTHING

Examples:
    (begin example)
		[player] call BLWK_fnc_addPlayerItems;
    (end)

Author(s):
	Ansible2 // Cipher // photoelf
---------------------------------------------------------------------------- */
scriptName "BLWK_fnc_addPlayerItems";

params [
	["_player",player,[objNull]]
];

_player addVest BLWK_defaultVestClass;

if (BLWK_playersStartWith_pistol) then {
	_player addMagazine BLWK_defaultPistolMagClass;
	_player addMagazine BLWK_defaultPistolMagClass;
	_player addWeapon BLWK_defaultPistolClass;
};

if (BLWK_playersStartWith_map) then {
	_player linkItem "ItemMap";
};

if (BLWK_playersStartWith_NVGs) then {
	_player linkItem "Integrated_NVG_F";
};

if (BLWK_playersStartWith_compass) then {
	_player linkItem "itemCompass";
};

if (BLWK_playersStartWith_radio) then {
	if (isClass (configfile >> "CfgVehicles" >> "tfar_anprc152")) exitWith {
		_player linkItem "tfar_anprc152";
	};
	if (isClass (configfile >> "CfgVehicles" >> "ACRE_PRC343")) exitWith {
		_player linkItem "ACRE_PRC343";
	};

	_player linkItem "itemRadio";
};

if (BLWK_playersStartWith_mineDetector) then {
	_player addItem "mineDetector";
};

if (BLWK_uniformClass isNotEqualTo "") then {
	player forceAddUniform BLWK_uniformClass;
	removeHeadgear _player;
};

if (BLWK_playersStartWith_backpack) then {
	_player addBackpack BLWK_defaultBackpackClass;
};
