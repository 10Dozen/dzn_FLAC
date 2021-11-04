#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Creates and applies 'Transform' recipe actions to recipe's items.
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
 * [
 *      "Transform",
 *      "Transforms item to another item",
 *      _components,
 *      config >> "CfgFLAC_Cookbook" >> "MyCystomRecipe"
 * ] call dzn_FLAC_cookbook_fnc_prepareRecipeTransform;
 *
 * Public: No
 */

params ["_actionDisplayName","_actionTooltip","_components","_recipeCfg"];

_components = _components apply { [configName _x, getText _x] };
TRACE_1("Components to process: ", count(_components));

private _fnc_formatAction = {
    params ["_item","_switchToItem"];

    private _switchItemName = GET_ITEM_NAME(_switchToItem);
    private _displayName = format [_actionDisplayName, _switchItemName];
    private _tooltip = format [_actionTooltip, _switchItemName];

    TRACE_5("* Format Transform action", _item, _switchToItem, _switchItemName);

    [
        format ["!%1", _item],
        ["UNIFORM_CONTAINER","VEST_CONTAINER","BACKPACK_CONTAINER"],
        [_displayName, _tooltip],
        [], "",
        { true },
        { _this call FUNC(transform) },
        true,
        _switchToItem
    ]
};

{
    _x params ["_itemA","_itemB"];

    ([_itemA, _itemB] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;
    ([_itemB, _itemA] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;
} forEach _components;
