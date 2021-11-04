#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Returns replacement option for given item for given weapon.
 *
 * Arguments:
 * 0: _weapon -- weapon class to check (STRING)
 * 1: _attachment -- item class to look for (STRING)
 * 2: _FLACType -- attachment type, one of the following: "FLAC_Muzzles","FLAC_Pointers","FLAC_Optics","FLAC_Bipods" (STRING)
 *
 * Return Value:
 * _replaceItem -- class of the item to replace with (or "" if there is no option) (STRING)
 *
 * Example:
 * _replaceItem = [_weapon, _item, "FLAC_Pointers"] call dzn_FLAC_main_fnc_getAttachmentReplaceOption;
 *
 * Public: No
 */

params ["_weapon", "_attachment", "_FLACType"];

private _weaponKey = format ["%1@%2", _weapon, _FLACType];

if (_weaponKey in GVAR(WeaponsOptions)) exitWith {
    // Read from cache and return
    (GVAR(WeaponsOptions) get _weaponKey) getOrDefault [_attachment, ""]
};

private _options = configProperties [configFile >> "CfgWeapons" >> _weapon >> _FLACType];
if (_options isEqualTo []) exitWith {
    // No options -- cache & return empty result
    GVAR(WeaponsOptions) set [_weaponKey, nil];
    ""
};

// Cache available options
private _weaponOptions = createHashMap;
{
    _weaponOptions set [configName _x, getText _x]
} forEach _options;
GVAR(WeaponsOptions) set [_weaponKey, _weaponOptions];

// Return value from cache
_weaponOptions getOrDefault [_attachment, ""]
