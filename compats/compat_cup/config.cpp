#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        name = COMPONENT;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main","dzn_FLAC_main","CUP_Weapons_LoadOrder"};
        author = "10Dozen";
        license = "https://www.bohemia.net/community/licenses/arma-public-license-share-alike";
        VERSION_CONFIG;
    };
};

#include "CfgFLAC.hpp"
#include "CfgFLAC_Cookbook.hpp"

#include "CfgWeapons.hpp"
