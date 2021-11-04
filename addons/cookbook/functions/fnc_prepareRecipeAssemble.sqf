#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Creates and applies 'Assemble' recipe actions to recipe's items.
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
 * [_actionDisplayName, _actionTooltip, _components, _recipeCfg] call dzn_FLAC_cookbook_fnc_prepareRecipeAssemble;
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
_components = _components apply { [configName _x, getArray _x] };
TRACE_1("Components to process: ", count(_components));

private _fnc_formatAction = {
    params ["_switchToItem","_item1","_item2"];

    private _displayName = format [_actionDisplayName, GET_ITEM_NAME(_item2)]; // "Combine with %1"
    private _tooltip = format [_actionTooltip, GET_ITEM_NAME(_switchToItem)]; // "Assembles two items together"

    TRACE_5("* Format Assemble action", _switchToItem, _item1, _item2, _displayName, _tooltip);

    [
        _item1,
        ["UNIFORM_CONTAINER","VEST_CONTAINER","BACKPACK_CONTAINER"],
        [_displayName, _tooltip],
        [], "",
        [{true}, {_this call FUNC(checkAssemble)}],
        { _this call FUNC(assemble) },
        true,
        [_switchToItem, _item2]
    ]
};

{
    _x params ["_assembledItem","_partItems"];

    private _mainItem = _partItems # 0;
    for "_i" from 1 to count(_partItems) - 1 do {
        private _secondaryItem = _partItems # _i;
        ([_assembledItem, _mainItem, _secondaryItem] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;
        ([_assembledItem, _secondaryItem, _mainItem] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;
    };
} forEach _components;
