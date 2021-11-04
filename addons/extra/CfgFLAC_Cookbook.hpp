
class CfgFLAC_Cookbook
{
    class CustomRecipes
    {
        PrimaryHandgunTransform = 1;
    };

    class PrimaryHandgunTransform
    {
        recipeName = "Primary to Handgun Switch";
        recipeDescription = "Allows to switch item from primary to handgun and back";

        displayName = "Swtich to %1";
        tooltip = "Switches current gun to %1 variant";
        recipeFunction = QUOTE(FUNC(prepareRecipePrimaryHandgunTransform));
        class Components {};
    };
};
