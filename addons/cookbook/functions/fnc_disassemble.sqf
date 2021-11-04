#include "script_component.hpp"
/*
 * Author: 10Dozen
 * 'Disassemble' recipe action. Consumes action's item.
 *
 * Arguments:
 * 0: _unit -- unit that invoked action (OBJECT)
 * 1: _container -- container where action was invoked (STRING)
 * 2: _item -- item used (STRING)
 * 3: _slot -- slot name (STRING)
 * 4: _args -- arguments array: 0: _mainItem (STRING), 1: _secondaryItem (STRING)
 *
 * Return Value:
 * none
 *
 * Example:
 * [
 *      player, "UNIFORM", "MyItemCombo", "UNIFORM_CONTAINR",
 *      ["MyItemlaser", "MyItemFlashlight"]
 * ] call dzn_FLAC_cookbook_fnc_disassemble;
 *
 * Public: No
 */

params ["_unit", "_container", "_item", "_slot", "_args"];
_args params ["_mainItem","_secondaryItem"];

TRACE_1("Item disassemble params", _this);

LOG_2("[DISASSEMBLE] Trying to add main item [%1] to [%2] container", _mainItem, _slot);
[_unit, _mainItem, _slot] call FUNC(addItem);

LOG_2("[DISASSEMBLE] Trying to add secondary item [%1] to [%2] container", _secondaryItem, _slot);
[_unit, _secondaryItem, _slot] call FUNC(addItem);
