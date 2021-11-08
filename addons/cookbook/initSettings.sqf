#include "script_component.hpp"

private _recipesClasses = [
    TRANSFORM_RECIPE,
    ASSEMBLE_RECIPE,
    DISASSEMBLE_RECIPE
];

_recipesClasses append ((configProperties [
    configFile >> "CfgFLAC_Cookbook" >> CUSTOM_RECIPES,
    "getNumber _x == 1"
]) apply { configName _x });

{
    private _recipe = (configFile >> "CfgFLAC_Cookbook" >> _x);
    private _recipeName = getText (_recipe >> "recipeName");
    private _recipeDesc = getText (_recipe >> "recipeDescription");

    if (_recipeName == "") then { _recipeName = _x; };

    diag_log format["[COOKBOOK] %1", _recipeName];

    [
        format [QGVAR(%1_Enabled), _x], /* dzn_FLAC_cookbook_%1_Enabled -> dzn_FLAC_cookbook_Transform_Enabled */
        "CHECKBOX",
        [format ["Enable %1", _recipeName], _recipeDesc],
        ["dzn Flexible Accessories", "Cookbook"],
        true,
        1,
        nil,
        true
    ] call CBA_fnc_addSetting;
} forEach _recipesClasses;
