#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Checks availability of the second component of the Assemble recipe in player's inventory.
 *
 * Arguments:
 * 0: _unit -- unit that invoked action (OBJECT)
 * 1: _container -- container where action was invoked (STRING)
 * 2: _item -- item used (STRING)
 * 3: _slot -- slot name (STRING)
 * 4: _args -- arguments array: 0: _switchToItem (STRING), 1: _requiredItem (STRING)
 *
 * Return Value:
 * _available -- flag that second item for assemble is present in the inventory (BOOLEAN)
 *
 * Example:
 * _available = [
 *      player, "UNIFORM", "MyItemUsed", "UNIFORM_CONTAINR",
 *      ["MyItemToAdd", "MyItemToCombineWith"]
 * ] call dzn_FLAC_cookbook_fnc_checkAssemble;
 *
 * Public: No
 */

params ["_unit", "", "", "_slot", "_args"];
_args params ["","_requiredItem"];

TRACE_1("params",_this);

[_unit, _requiredItem] call FUNC(hasItem)
