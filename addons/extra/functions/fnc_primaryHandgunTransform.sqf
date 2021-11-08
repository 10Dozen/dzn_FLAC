#include "script_component.hpp"
/*
 * Author: 10Dozen
 * 'Primary-Handgun Transform' recipe action. Consumes action's item.
 *
 * Arguments:
 * 0: _unit -- unit that invoked action (OBJECT)
 * 1: _container -- container where action was invoked (STRING)
 * 2: _item -- item used (STRING)
 * 3: _slot -- slot name (STRING)
 * 4: _switchToGun -- classname of the replacement option (STRING)
 *
 * Return Value:
 * none
 *
 * Example:
 * [player, "RIFLE", "MyRifle", "RIFLE", "MyHandgun"] call dzn_FLAC_cookbook_fnc_primaryHandgunTransform;
 *
 * Public: No
 */

params ["_unit", "_container", "_gun", "_slot", "_switchToGun"];

TRACE_1("Item primary-secondary transform", _this);

if (_slot == "RIFLE") then {
    // --- Primary -> Secondary
    private _attaches = primaryWeaponItems _unit;
    private _magazine = primaryWeaponMagazine _unit # 0;
    private _ammo = _unit ammo _gun;

    _unit removeWeapon _gun;
    _unit addWeapon _switchToGun;
    { _unit addHandgunItem _x } forEach _attaches;

    TRACE_4('Swapped to pistol', _switchToGun, _attaches, _magazine, _ammo);

    [{
        params ["_unit","_switchedGun","_magazine","_ammo"];
        TRACE_1("[SWAP GUN] Loading magazine params", _this);
        // Restore auto-loaded magazine
        _loadedMagazine = (handgunMagazine _unit) param [0];
        TRACE_1("Loaded magazine", _loadedMagazine);
        if (!isNil "_loadedMagazine") then {
            TRACE_1("Adding back used magazine", _loadedMagazine);
            _unit addMagazine [_loadedMagazine, _unit ammo _switchedGun];
        };
        // Set magazine that was used before transformation
        _unit addWeaponItem [_switchedGun, [_magazine, _ammo, _switchedGun], true];
    }, [_unit, _switchToGun, _magazine, _ammo]] call CBA_fnc_execNextFrame;

} else {
    // --- Secondary -> Primary
    private _attaches = handgunItems _unit;
    private _magazine = handgunMagazine _unit # 0;
    private _ammo = _unit ammo _gun;

    _unit removeWeapon _gun;
    _unit addWeapon _switchToGun;
    { _unit addPrimaryWeaponItem _x } forEach _attaches;

    TRACE_4('Swapped to rifle', _switchToGun, _attaches, _magazine, _ammo);

    [{
        params ["_unit","_switchedGun","_magazine","_ammo"];
        TRACE_1("[SWAP GUN] Loading magazine params", _this);
        // Restore auto-loaded magazine
        _loadedMagazine = (primaryWeaponMagazine _unit) param [0];

        TRACE_1("Loaded magazine", _loadedMagazine);

        if (!isNil "_loadedMagazine") then {
            TRACE_1("Adding back used magazine", _loadedMagazine);
            _unit addMagazine [_loadedMagazine, _unit ammo _switchedGun];
        };
        // Set magazine that was used before transformation
        _unit addWeaponItem [_switchedGun, [_magazine, _ammo, _switchedGun], true];
    }, [_unit, _switchToGun, _magazine, _ammo]] call CBA_fnc_execNextFrame;
};
