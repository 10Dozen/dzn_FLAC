
class CfgFLAC_Cookbook
{
    class CustomRecipes {};
    class Transform
    {
        recipeName = "Item transform";
        recipeDescription = "Tramsforms item to some another variant of this item (e.g. laser top or side mount)";
        recipeFunction = QFUNC(prepareRecipeTransform);
        displayName = "Switch to %1";
        tooltip = "Switches current item to %1";
        class Components {};
    };
    class Assemble
    {
        recipeName = "Item Assemble";
        recipeDescription = "Allows to assemble 2 items into new one (e.g. laser and flashlight to combo variant)";
        recipeFunction = QFUNC(prepareRecipeAssemble);
        displayName = "Combine with %1";
        tooltip = "Assembles two items together to get %1";
        class Components {};
    };
    class Disassemble
    {
        recipeName = "Item Disassemble";
        recipeDescription = "Allows to disassemble item into pieces (e.g. laser + flashlight combo to separate items)";
        recipeFunction = QFUNC(prepareRecipeDisassemble);
        displayName = "Split items";
        tooltip = "Splits items %1 and %2";
        class Components {};
    };
};
