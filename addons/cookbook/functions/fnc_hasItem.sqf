#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Checks for item in the unit's inventory. If _slot param passed - searches only in given slots.
 *
 * Arguments:
 * 0: _unit -- target unit (OBJECT)
 * 1: _item -- item to add (STRING)
 * 2: _slots -- slots to search for item. Optional, by default looks everywhere (ARRAY)
 *
 * Return Value:
 * _found -- flag that item was found in unit's inventory or given slots (BOOLEAN)
 *
 * Example:
 * _found = [player, "MyItem", ["UNIFORM_CONTAINER"]] call dzn_FLAC_cookbook_fnc_hasItem;
 *
 * Public: No
 */

params ["_unit", "_item", ["_slots",[]]];
TRACE_1("params",_this);

if (_slots isEqualTo []) exitWith {
    LOG_1("[HAS ITEM] Slot is not passed, check for item in entire inventory: %1", (items _unit) findIf { _x == _item } > -1);
    (items _unit) findIf { _x == _item } > -1
};

private _found = false;
{
    private _items = switch _x do {
        case "UNIFORM_CONTAINER": { uniformItems _unit };
        case "VEST_CONTAINER": { vestItems _unit };
        case "BACKPACK_CONTAINER": { backpackItems _unit };
    };

    _found = _items findIf { _x == _item } > -1;
    LOG_2("[HAS ITEM] Checked for %1 container, and result is %2", _x, _found);

    if _found exitWith {
        LOG_2("[HAS ITEM] Found %1 in slot %2", _item, _x);
    };
} forEach _slots;

LOG_1("[HAS ITEM] Result: %1", _found);

_found
