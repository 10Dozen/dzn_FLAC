#include "script_component.hpp"
/*
 * Author: 10Dozen
 * 'Assemble' recipe action. Consumes action's item.
 *
 * Arguments:
 * 0: _unit -- unit that invoked action (OBJECT)
 * 1: _container -- container where action was invoked (STRING)
 * 2: _item -- item used (STRING)
 * 3: _slot -- slot name (STRING)
 * 4: _args -- arguments array: 0: _switchToItem (STRING), 1: _requiredItem (STRING)
 *
 * Return Value:
 * none
 *
 * Example:
 * [
 *      player, "UNIFORM", "MyItemUsed", "UNIFORM_CONTAINR",
 *      ["MyItemToAdd", "MyItemToCombineWith"]
 * ] call dzn_FLAC_cookbook_fnc_assemble;
 *
 * Public: No
 */

params ["_unit", "_container", "_item", "_slot", "_args"];
_args params ["_switchToItem","_requiredItem"];

TRACE_1("Item assemble params", _this);

// --- Try to use item from the same container as used item, otherwise pick any
private _requiredItemSlot = [nil, _slot] select ([_unit, _requiredItem, [_slot]] call FUNC(hasItem));
TRACE_1("Required slot", _requiredItemSlot);
[_unit, _requiredItem, _requiredItemSlot] call FUNC(removeItem);

// --- Wait for the next frame to ensure that there will be some spare space for new item
LOG_2("[ASSEMBLE] Adding item [%1] to slot [%2] in the next frame", _item, _slot);
[{ _this call FUNC(addItem); }, [_unit, _switchToItem, _slot]] call CBA_fnc_execNextFrame;
