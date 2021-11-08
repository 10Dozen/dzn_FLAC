#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Reads and processes recipes available in CfgFLAC_Cookbooks class.
 * Always reads Transform, Assemble and Disassemble recipes, then reads
 * recipes enabled in CfgFLAC_Cookbook >> CustomRecipes.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * none
 *
 * Example:
 * [] call dzn_FLAC_cookbook_fnc_readCookbook;
 *
 * Public: No
 */

private _allRecipes = [
    TRANSFORM_RECIPE,
    ASSEMBLE_RECIPE,
    DISASSEMBLE_RECIPE
];
private _customRecipes = (configProperties [
    configFile >> "CfgFLAC_Cookbook" >> CUSTOM_RECIPES,
    "getNumber _x == 1"
]) apply { configName _x };

diag_log "[COOKBOOK Read] Started";
LOG_1("[COOKBOOK Read] Default Recepies: %1", _allRecipes);
LOG_1("[COOKBOOK Read] Custom Recepies: %1", _customRecipes);

_allRecipes append _customRecipes;

{
    private _enabled = call compile format [QGVAR(%1_Enabled), _x];
    LOG_2("[COOKBOOK Read] Reading recipe [%1]: Enabled: %2", _x, _enabled);

    // --- Process only recipes enabled in settings
    if (call compile format [QGVAR(%1_Enabled), _x]) then {
        private _recipeCfg = configFile >> "CfgFLAC_Cookbook" >> _x;
        private _recipeFunctionName = getText (_recipeCfg >> "recipeFunction");
        private _recipeFunction = missionNamespace getVariable [getText (_recipeCfg >> "recipeFunction"), nil];

        TRACE_3("params", _x, _recipeCfg, _recipeFunctionName, isNil "_recipeFunction");

        if (isNil "_recipeFunction") then {
            // Some error message here...
            LOG_1("No Recipe's function %1 found (probably 3rd party recipe). Wait for init...", _recipeFunctionName);
            [
                { !isNil (_this # 1) },
                { _this call FUNC(initRecipe); },
                [_recipeCfg, _recipeFunctionName],
                2,
                { ERROR_1("Failed to find recipe's function %1", _recipeFunctionName)}
            ] call CBA_fnc_waitUntilAndExecute;
            continue;
        };

        LOG_1("Recipe's function %1 found, start recipe's init", _recipeFunctionName);
        [_recipeCfg, _recipeFunctionName] call FUNC(initRecipe);
    };
} forEach _allRecipes;
