if (isServer) then {
    [] spawn {
        waitUntil {!isNull (allPlayers select 0)};
        _firstPlayer = allPlayers select 0;
        _curator = createGroup sideLogic createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
        _firstPlayer assignCurator _curator;
        ["Zeus assigned to %1", name _firstPlayer] remoteExec ["systemChat", 0];
    };
};

// get rid of any old saved mission params
if (profileNamespace getVariable ["BLWK_savedMissionParameters",[]] isNotEqualTo []) then {
    profileNamespace setVariable ["BLWK_savedMissionParameters",nil];
    saveProfileNamespace;
};