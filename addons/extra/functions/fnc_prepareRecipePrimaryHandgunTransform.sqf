#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Creates and applies 'Primary-Handgun Transform' recipe actions to recipe's items.
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
 * [_actionDisplayName, _actionTooltip, _components, _recipeCfg] call dzn_FLAC_extra_fnc_prepareRecipePrimaryHandgunTransform;
 *
 * Public: No
 */

params ["_actionDisplayName","_actionTooltip","_components","_recipeCfg"];

TRACE_1("Components to process: ", count(_components));
/*
class Components
{
    CUP_smg_MP7 = "CUP_hgun_MP7";
    CUP_smg_MP7_desert = "CUP_hgun_MP7_desert";
    CUP_smg_MP7_woodland = "CUP_hgun_MP7_woodland";
};
*/

_components = _components apply {
    [configName _x, getText _x]
};
TRACE_1("Components to process: ", count(_components));

private _fnc_formatAction = {
    params ["_slot", "_item", "_switchToItem"];

    private _isRifleAction = (_slot == "RIFLE");

    private _text = ["primary","pistol"] select _isRifleAction
    private _displayName = format [_actionDisplayName, _text];
    private _tooltip = format [_actionTooltip, _text];
    private _condition = [
        {primaryWeapon _this # 0 == ""},
        {handgunWeapon _this # 0 == ""}
    ] select _isRifleAction;

    TRACE_8("* Format Primary-Secondary action", _slot, _item, _switchToItem, _isRifleAction, _text, _displayName, _tooltip, _condition);

    [
        _item,
        _slot,
        [_displayName, _tooltip],
        [], "",
        _condition,
        { _this call FUNC(primarySecondaryTransform) },
        false,
        _switchToItem
    ]
};

{
    _x params ["_primary","_handgun"];

    LOG_2("[RECIPE PRIMARY-SECONDARY] Add Rifle2Handgun action [%1, %2]", _primary, _handgun);
    (["RIFLE", _primary, _handgun] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;

    LOG_2("[RECIPE PRIMARY-SECONDARY] Add Handgun2Rifle action [%1, %2]", _handgun, _primary);
    (["PISTOL", _handgun, _primary] call _fnc_formatAction) call CBA_fnc_addItemContextMenuOption;
} forEach _components;
