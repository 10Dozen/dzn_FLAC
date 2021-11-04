#include "script_component.hpp"
/*
 * Author: 10Dozen
 * 'Transform' recipe action. Consumes action's item.
 *
 * Arguments:
 * 0: _unit -- unit that invoked action (OBJECT)
 * 1: _container -- container where action was invoked (STRING)
 * 2: _item -- item used (STRING)
 * 3: _slot -- slot name (STRING)
 * 4: _switchToItem -- item to transform to (STRING)
 *
 * Return Value:
 * none
 *
 * Example:
 * [player, "UNIFORM", "MyItemUsed", "UNIFORM_CONTAINR", "MyItemToAdd"] call dzn_FLAC_cookbook_fnc_transform;
 *
 * Public: No
 */

params ["_unit", "_container", "_item", "_slot", "_switchToItem"];

LOG_1("Item transform params: %1", _this);
[_unit, _switchToItem, _slot] call FUNC(addItem);
