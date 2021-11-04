#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;


if (!hasInterface) exitWith {};

GVAR(WeaponsOptions) = createHashMap;

["loadout", {
    _this call FUNC(handleLoadoutChange);
}] call CBA_fnc_addPlayerEventHandler;
