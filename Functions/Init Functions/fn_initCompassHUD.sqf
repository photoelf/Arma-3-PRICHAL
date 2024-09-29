if (!hasInterface) exitWith {};

("BLWK_compassLayer" call BIS_fnc_rscLayer) cutRsc ["RscCompass", "PLAIN", -1, false];

addMissionEventHandler ["EachFrame", {
    private _display = uiNamespace getVariable ["BLWK_compassHUD", displayNull];
    if (isNull _display) exitWith {};
    
    private _ctrl = _display displayCtrl 1201;
    private _dir = round(getDir player);
    private _cardinalDir = switch (true) do {
        case (_dir >= 337.5 || _dir < 22.5): {"N"};
        case (_dir >= 22.5 && _dir < 67.5): {"NE"};
        case (_dir >= 67.5 && _dir < 112.5): {"E"};
        case (_dir >= 112.5 && _dir < 157.5): {"SE"};
        case (_dir >= 157.5 && _dir < 202.5): {"S"};
        case (_dir >= 202.5 && _dir < 247.5): {"SW"};
        case (_dir >= 247.5 && _dir < 292.5): {"W"};
        case (_dir >= 292.5 && _dir < 337.5): {"NW"};
    };
    _ctrl ctrlSetText format ["%1° %2", _dir, _cardinalDir];
}];