#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Creates and applies 'Disassemble' recipe actions to recipe's items.
 * Reads both 'Disassemble' and 'Assemble' components to create actions.
 *
 * Arguments:
 * 0: _actionDisplayName -- recipe's action display name <STRING>
 * 1: _actionTooltip -- recipe's action tooltip <STRING>
 * 2: _components -- list of Componments config properties <ARRAY of config entries>
 * 3: _recipeCfg -- recipe class config (Config Entry)
 *
 * Return Value:
 * none
 *
 * Example:
 * [_actionDisplayName, _actionTooltip, _components, _recipeCfg] call dzn_FLAC_cookbook_fnc_prepareRecipeDisassemble;
 *
 * Public: No
 */

params ["_actionDisplayName","_actionTooltip","_components","_recipeCfg"];

/*
    CUP_acc_ANPEQ_15_Flashlight_Tan_L[] = {
        "CUP_acc_ANPEQ_15", "CUP_acc_Flashlight_desert",
        "", "CUP_acc_Flashlight",
        "", "CUP_acc_Flashlight_wdl"
    };
*/

// -- Combine both Disassemble and Assemble components
_components append (configProperties [configFile >> "CfgFLAC_Cookbook" >> ASSEMBLE_RECIPE >> "Components"]);

_components = _components apply { [configName _x, getArray _x] };
TRACE_1("Components to process: ", count(_components));

private _fnc_formatAction = {
    params ["_assembledItem","_item1","_item2"];

    private _displayName = _actionDisplayName; // "Split items"
    private _tooltip = format [_actionTooltip, GET_ITEM_NAME(_item1), GET_ITEM_NAME(_item2)]; // "Splits items %1 and %2"

    //TRACE_5("* Format Disassemble action", _assembledItem, _item1, _item2, _displayName, _tooltip);

    [
        _assembledItem,
        ["UNIFORM_CONTAINER","VEST_CONTAINER","BACKPACK_CONTAINER"],
        [_displayName, _tooltip],
        [], "",
        { true },
        { _this call FUNC(disassemble) },
        true,
        [_item1, _item2],
        false
    ]
};

{
    _x params ["_assembledItem","_partItems"];
    _partItems params ["_mainItem","_secondaryItem"];

    TRACE_2("Split items", _mainItem, _secondaryItem);
    ([_assembledItem, _mainItem, _secondaryItem] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;
} forEach _components;
