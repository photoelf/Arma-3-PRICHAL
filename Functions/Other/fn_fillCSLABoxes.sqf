BLWK_fnc_fillCSLALaunchersBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    
    private _launchers = BLWK_loot_launchers;
    private _selectedLaunchers = [];
    for "_i" from 1 to 20 do {
        private _launcher = selectRandom (_launchers - _selectedLaunchers);
        _selectedLaunchers pushBack _launcher;
        _box addWeaponCargoGlobal [_launcher, 4];
    };
};

BLWK_fnc_fillCSLAAmmunitionBox = {
    params ["_box"];
    clearMagazineCargoGlobal _box;
    
    private _magazines = BLWK_loot_weaponClasses apply {selectRandom (getArray (configFile >> "CfgWeapons" >> _x >> "magazines"))};
    _magazines = _magazines arrayIntersect _magazines;
    private _selectedMagazines = [];
    for "_i" from 1 to 20 do {
        private _magazine = selectRandom (_magazines - _selectedMagazines);
        _selectedMagazines pushBack _magazine;
        _box addMagazineCargoGlobal [_magazine, 4];
    };
};

BLWK_fnc_fillCSLAFirearmsBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    
    private _weapons = BLWK_loot_weaponClasses;
    private _selectedWeapons = [];
    for "_i" from 1 to 20 do {
        private _weapon = selectRandom (_weapons - _selectedWeapons);
        _selectedWeapons pushBack _weapon;
        _box addWeaponCargoGlobal [_weapon, 4];
    };
};

BLWK_fnc_fillCSLAExplosivesBox = {
    params ["_box"];
    clearMagazineCargoGlobal _box;
    
    private _explosives = BLWK_loot_explosiveClasses;
    private _selectedExplosives = [];
    for "_i" from 1 to 20 do {
        private _explosive = selectRandom (_explosives - _selectedExplosives);
        _selectedExplosives pushBack _explosive;
        _box addMagazineCargoGlobal [_explosive, 4];
    };
};

BLWK_fnc_fillCSLASupportBox = {
    params ["_box"];
    clearItemCargoGlobal _box;
    
    private _items = BLWK_loot_itemClasses;
    private _selectedItems = [];
    for "_i" from 1 to 20 do {
        private _item = selectRandom (_items - _selectedItems);
        _selectedItems pushBack _item;
        _box addItemCargoGlobal [_item, 4];
    };
};

BLWK_fnc_fillCSLAStaticWeaponsBox = {
    params ["_box"];
    clearBackpackCargoGlobal _box;
    
    private _staticWeapons = ["CSLA_Tripod_Bag", "CSLA_UK59_Gun_Bag"];
    private _selectedStaticWeapons = [];
    for "_i" from 1 to (count _staticWeapons) do {
        private _staticWeapon = selectRandom (_staticWeapons - _selectedStaticWeapons);
        _selectedStaticWeapons pushBack _staticWeapon;
        _box addBackpackCargoGlobal [_staticWeapon, 4];
    };
    
    // If there are less than 20 static weapons, fill the rest with random items
    if (count _staticWeapons < 20) {
        private _remainingItems = BLWK_loot_itemClasses;
        for "_i" from (count _staticWeapons + 1) to 20 do {
            private _item = selectRandom _remainingItems;
            _remainingItems = _remainingItems - [_item];
            _box addItemCargoGlobal [_item, 4];
        };
    };
};

BLWK_fnc_fillVDVWeaponsBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    
    private _weapons = BLWK_loot_weaponClasses;
    private _selectedWeapons = [];
    for "_i" from 1 to 20 do {
        private _weapon = selectRandom (_weapons - _selectedWeapons);
        _selectedWeapons pushBack _weapon;
        _box addWeaponCargoGlobal [_weapon, 4];
        
        private _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
        if (count _magazines > 0) then {
            _box addMagazineCargoGlobal [selectRandom _magazines, 8];
        };
    };
};

BLWK_fnc_fillAVRifleBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    
    private _rifles = BLWK_loot_primaryWeapons;
    private _selectedRifles = [];
    for "_i" from 1 to 20 do {
        private _rifle = selectRandom (_rifles - _selectedRifles);
        _selectedRifles pushBack _rifle;
        _box addWeaponCargoGlobal [_rifle, 4];
        
        private _magazines = getArray (configFile >> "CfgWeapons" >> _rifle >> "magazines");
        if (count _magazines > 0) then {
            _box addMagazineCargoGlobal [selectRandom _magazines, 8];
        };
    };
};

BLWK_fnc_fillAVAllRifleBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    
    private _weapons = BLWK_loot_weaponClasses;
    private _selectedWeapons = [];
    for "_i" from 1 to 20 do {
        private _weapon = selectRandom (_weapons - _selectedWeapons);
        _selectedWeapons pushBack _weapon;
        _box addWeaponCargoGlobal [_weapon, 4];
        
        private _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
        if (count _magazines > 0) then {
            _box addMagazineCargoGlobal [selectRandom _magazines, 8];
        };
    };
};

BLWK_fnc_fillCUPRussianVirtualArsenalBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    
    [_box, true] call ace_arsenal_fnc_initBox;
};

BLWK_fnc_fillSMAWeaponBox = {
    params ["_box"];
    clearWeaponCargoGlobal _box;
    clearMagazineCargoGlobal _box;
    clearItemCargoGlobal _box;
    clearBackpackCargoGlobal _box;
    
    private _smaWeapons = BLWK_loot_weaponClasses select {_x call BIS_fnc_itemType select 0 == "Weapon" && {_x call BIS_fnc_itemType select 1 in ["AssaultRifle", "MachineGun", "SniperRifle", "Shotgun", "SubmachineGun"]} && {(getText (configFile >> "CfgWeapons" >> _x >> "author")) == "Red Hammer Studios"}};
    
    private _selectedWeapons = [];
    for "_i" from 1 to 20 do {
        private _weapon = selectRandom (_smaWeapons - _selectedWeapons);
        _selectedWeapons pushBack _weapon;
        _box addWeaponCargoGlobal [_weapon, 4];
        
        private _magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
        if (count _magazines > 0) then {
            _box addMagazineCargoGlobal [selectRandom _magazines, 8];
        };
    };
};