#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Adds item to unit's inventory.
 *
 * Arguments:
 * 0: _unit -- target unit (OBJECT)
 * 1: _item -- item to add (STRING)
 * 2: _slot -- slot to add item (STRING)
 *
 * Return Value:
 * none
 *
 * Example:
 * [player, "MyItem", "UNIFORM_CONTAINER"] call dzn_FLAC_cookbook_fnc_addItem;
 *
 * Public: No
 */

params ["_unit", "_item", "_slot"];
TRACE_1("params",_this);

private _itemAdded = false;

switch _slot do {
    case "UNIFORM_CONTAINER": {

        if (_unit canAddItemToUniform _item) then {
            _unit addItemToUniform _item;
            _itemAdded = true;
            TRACE_1("[ADD ITEM] Can add to uniform: ", _item);
        };
    };
    case "VEST_CONTAINER": {
        if (_unit canAddItemToVest _item) then {
            _unit addItemToVest _item;
            _itemAdded = true;
            TRACE_1("[ADD ITEM] Can add to vest: ", _item);
        };
    };
    case "BACKPACK_CONTAINER": {
        if (_unit canAddItemToBackpack _item) then {
            _unit addItemToBackpack _item;
            _itemAdded = true;
            TRACE_1("[ADD ITEM] Can add to backpack: ", _item);
        };
    };
};

if _itemAdded exitWith {
    LOG_2("[ADD ITEM] Item [%1] added to [%2]!", _item, _slot);
};

LOG_2("[ADD ITEM] Item [%1] NOT added to [%2], trying to use CBA_fnc_addItem", _item, _slot);

// If not added to target slot -- add to any container or drop to the ground
TRACE_2("[ADD ITEM] CBA_fnc_addItem", _unit, _item);
[_unit, _item, true] call CBA_fnc_addItem;
