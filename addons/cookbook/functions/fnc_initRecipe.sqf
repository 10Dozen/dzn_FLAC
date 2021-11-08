#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Inits given recipe with specific recipe's function.
 *
 * Arguments:
 * 0: _recipeCfg -- recipe class config (Config Entry)
 * 1: _recipeFunctionName -- name of the recipe function. Optional, default: none <STRING>
 *
 * Return Value:
 * none
 *
 * Example:
 * [configFile >> "CfgFLAC_Cookbook" >> "Recipe1"] call dzn_FLAC_cookbook_fnc_initRecipe;
 *
 * Public: No
 */

params ["_recipeCfg", ["_recipeFunctionName", getText (_this # 0 >> "recipeFunction")]];

private _recipeFunction =  missionNamespace getVariable _recipeFunctionName;
LOG_1("Recipe's init started by %1 function", _recipeFunctionName);

[
    getText (_recipeCfg >> "displayName"),
    getText (_recipeCfg >> "tooltip"),
    configProperties [_recipeCfg >> "Components"],
    _recipeCfg
] call _recipeFunction;
