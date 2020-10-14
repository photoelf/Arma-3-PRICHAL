/* ----------------------------------------------------------------------------
Function: BLWK_fnc_cruiseMissileStrike

Description:
	Spawns a cruise missile at designated "launcher" and then guides it to a target 

Parameters:
	0: _target <OBJECT or ARRAY> - Target to hit missile with, can also be a position (AGL)

Returns:
	NOTHING

Examples:
    (begin example)

		null = [target_1,6] spawn BLWK_fnc_cruiseMissileStrike;

    (end)

Authors:
	Arma 3 Discord,
	Modified by: Ansible2 // Cipher
---------------------------------------------------------------------------- */
if (!canSuspend) exitWith {
	"Must be run in scheduled envrionment" call BIS_fnc_error
};

params [
	["_target",objNull,[objNull,[]]]
];

// get firing position and give it some alititude
private _missileLaunchPosition = [BLWK_playAreaMarker,true] call CBAP_fnc_randPosArea;
_missileLaunchPosition = _missileLaunchPosition vectorAdd [0,0,1000];
private _launcher = createVehicle ["B_Ship_MRLS_01_F",_missileLaunchPosition vectorDiff [0,0,7],[],0,"FLY"];
createVehicleCrew _launcher;
_launcher allowDamage false;
_launcher enableSimulationGlobal false;
//create Missile
private _missile = "ammo_Missile_Cruise_01" createVehicle _missileLaunchPosition;  
_missile setVectorDirAndUp [[0, 0, 1], [1, 0, 0]];

// get target position
private "_targetPosition";
if (_target isEqualType objNull) then {
	_targetPosition = getPosWorld _target;
} else {
	_targetPosition = _target;
};

private _laserTarget =  createVehicle ["LaserTargetW",_targetPosition,[],0,"CAN_COLLIDE"];    
BLUFOR reportRemoteTarget [_laserTarget, 3600];  

// having issues remoteExecing even on server
//[_missile,[_launcher,gunner _launcher]] remoteExec ["setShotParents",2];
_missile setShotParents [_launcher,gunner _launcher];  

_missile setMissileTarget _laserTarget;

[_missile] spawn {
	params ["_missile"];
	while {alive _missile} do {
		sleep 1;

		hint str (getPosATL _missile)
	};
};

waitUntil {
	if (!alive _missile) exitWith {true};
	sleep 5;
	false
};

deleteVehicle _laserTarget;
_launcher deleteVehicleCrew (gunner _launcher);
deleteVehicle _launcher;