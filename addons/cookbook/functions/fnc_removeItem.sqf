#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Removes item from unit's inventory.
 *
 * Arguments:
 * 0: _unit -- target unit (OBJECT)
 * 1: _item -- item to remove (STRING)
 * 2: _slot -- slot to remove item from. Optional, by default removes 1 item from any inventory container (STRING)
 *
 * Return Value:
 * none
 *
 * Example:
 * [player, "MyItem", "UNIFORM_CONTAINER"] call dzn_FLAC_cookbook_fnc_removeItem;
 *
 * Public: No
 */

params ["_unit", "_item", ["_slot", ""]];

switch _slot do {
    case "UNIFORM_CONTAINER": {
        _unit removeItemFromUniform _item;
    };
    case "VEST_CONTAINER": {
        _unit removeItemFromVest _item;
    };
    case "BACKPACK_CONTAINER": {
        _unit removeItemFromBackpack _item;
    };
    default {
        _unit removeItem _item;
    };
};
