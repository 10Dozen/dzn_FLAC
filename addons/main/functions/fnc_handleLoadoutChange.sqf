#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Handles loadout event - checks for accessories update and adjust them if needed.
 *
 * Arguments:
 * 0: _unit -- unit EH applied (OBJECT)
 * 1: _newLoadout -- changed loadout (ARRAY)
 * 2: _oldLoadout -- previous loadout (ARRAY)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _newLoadout, _oldLoadout] call dzn_FLAC_main_fnc_handleLoadoutChange
 *
 * Public: No
 */
params ["_unit", "_newLoadout", "_oldLoadout"];

if (_oldLoadout isEqualTo []) exitWith {};

{
    private _weaponInfoId = _x;
    private _weapon = _newLoadout # _weaponInfoId # 0;

    if (_weapon isNotEqualTo "") then {
        private _weaponOld = (_oldLoadout # _weaponInfoId) param [0,""];
        private _weaponUpdated = _weapon isNotEqualTo _weaponOld;
        LOG_3("Weapon old: %1, Weapon new: %2, weaponUpdated: %3", _weaponOld, _weapon, _weaponUpdated);

        {
            _x params ["_accessoryId","_FLACType"];

            private _item = (_newLoadout # _weaponInfoId) param [_accessoryId, ""];
            private _oldItem = (_oldLoadout # _weaponInfoId) param [_accessoryId, ""];

            // Check for replacement on weapon/item change only
            LOG_5("Item exists: %1 AND (Weapon Updated: %2 <OR> Item updated: %3) [New: %4, Old: %5]", _item isNotEqualTo "", _weaponUpdated, _item isNotEqualTo _oldItem, _oldItem, _item);
            if (_item isNotEqualTo "" && {_weaponUpdated || _item isNotEqualTo _oldItem}) then {
                private _exchangeItem = [_weapon, _item, _FLACType] call FUNC(getAttachmentReplaceOption);
                LOG_1("Possible exchange item: %1", _exchangeItem);
                if (_exchangeItem isNotEqualTo "") then {
                    LOG_2("Exchange %1 with %2", _item, _exchangeItem);
                    _unit addWeaponItem [_weapon, _exchangeItem, true];
                };
            };
        } forEach [
            [MUZZLE_ID, MUZZLE_FLAC_TYPE],
            [POINTER_ID, POINTER_FLAC_TYPE],
            [OPTICS_ID, OPTICS_FLAC_TYPE],
            [BIPOD_ID, BIPOD_FLAC_TYPE]
        ];
    };
} forEach [
    RIFLE_INFO_ID,
    LAUNCHER_INFO_ID,
    HANDGUN_INFO_ID
];
