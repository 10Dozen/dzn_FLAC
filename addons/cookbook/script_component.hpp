#define COMPONENT cookbook
#include "\z\dzn_FLAC\addons\main\script_mod.hpp"

#define DEBUG_ENABLED_COOKBOOK
// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_COOKBOOK
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_ENABLED_COOKBOOK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COOKBOOK
#endif

#include "\z\dzn_FLAC\addons\main\script_macros.hpp"

#define CUSTOM_RECIPES QUOTE(CustomRecipes)
#define TRANSFORM_RECIPE QUOTE(Transform)
#define ASSEMBLE_RECIPE QUOTE(Assemble)
#define DISASSEMBLE_RECIPE QUOTE(Disassemble)

// #define GET_ITEM_NAME(ITEM) getText (configFile >> "CfgWeapons" >> ITEM >> "displayName")
#define GET_ITEM_NAME(ITEM) ITEM
