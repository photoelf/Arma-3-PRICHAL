if (isServer) then {
    private _loaded = [] call BLWK_fnc_loadGame;
    if (!_loaded) then {
        // Инициализация новой игры, если сохранение не найдено
        [] call BLWK_fnc_prepareGlobals;
    };
};

// get rid of any old saaved mission params
if (profileNamespace getVariable ["BLWK_savedMissionParameters",[]] isNotEqualTo []) then {
    profileNamespace setVariable ["BLWK_savedMissionParameters",nil];
    saveProfileNamespace;
};
// Disable fog
0 setFog 0;
forceWeatherChange;