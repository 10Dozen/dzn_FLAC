
class CfgFLAC_Cookbook
{
    class Transform
    {
        class Components
        {
            CUP_acc_ANPEQ_15_Tan_Top = "CUP_acc_ANPEQ_15";
            CUP_acc_ANPEQ_15_Tan_Top_V = "CUP_acc_ANPEQ_15_V";
            CUP_acc_ANPEQ_15_Black_Top = "CUP_acc_ANPEQ_15_Black";
            CUP_acc_ANPEQ_15_Black_Top_V = "CUP_acc_ANPEQ_15_Black_V";
            CUP_acc_ANPEQ_15_OD_Top = "CUP_acc_ANPEQ_15_OD";
            CUP_acc_ANPEQ_15_OD_Top_V = "CUP_acc_ANPEQ_15_OD_V";
            CUP_acc_ANPEQ_2_Black_Top = "CUP_acc_ANPEQ_2";
            CUP_acc_ANPEQ_2_OD_Top = "CUP_acc_ANPEQ_2_camo";
            CUP_acc_ANPEQ_2_Coyote_Top = "CUP_acc_ANPEQ_2_desert";
            CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L = "CUP_acc_ANPEQ_15_Flashlight_Tan_L";
            CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F = "CUP_acc_ANPEQ_15_Flashlight_Tan_F";
            CUP_acc_ANPEQ_15_Top_Flashlight_Tan_V = "CUP_acc_ANPEQ_15_Flashlight_Tan_V";
            CUP_acc_ANPEQ_15_Top_Flashlight_OD_L = "CUP_acc_ANPEQ_15_Flashlight_OD_L";
            CUP_acc_ANPEQ_15_Top_Flashlight_OD_F = "CUP_acc_ANPEQ_15_Flashlight_OD_F";
            CUP_acc_ANPEQ_15_Top_Flashlight_OD_V = "CUP_acc_ANPEQ_15_Flashlight_OD_V";
            CUP_acc_ANPEQ_15_Top_Flashlight_Black_L = "CUP_acc_ANPEQ_15_Flashlight_Black_L";
            CUP_acc_ANPEQ_15_Top_Flashlight_Black_F = "CUP_acc_ANPEQ_15_Flashlight_Black_F";
            CUP_acc_ANPEQ_15_Top_Flashlight_Black_V = "CUP_acc_ANPEQ_15_Flashlight_Black_V";
        };
    };
    class Assemble
    {
        class Components
        {
            CUP_acc_ANPEQ_15_Flashlight_Tan_L[] = {"CUP_acc_ANPEQ_15", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Flashlight_Tan_V[] = {"CUP_acc_ANPEQ_15_V", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L[] = {"CUP_acc_ANPEQ_15_Tan_Top", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Top_Flashlight_Tan_V[] = {"CUP_acc_ANPEQ_15_Tan_Top_V", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight", "CUP_acc_Flashlight_wdl"};

            CUP_acc_ANPEQ_15_Flashlight_OD_L[] = {"CUP_acc_ANPEQ_15_OD", "CUP_acc_Flashlight_wdl", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert"};
            CUP_acc_ANPEQ_15_Flashlight_OD_V[] = {"CUP_acc_ANPEQ_15_OD_V", "CUP_acc_Flashlight_wdl", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert"};
            CUP_acc_ANPEQ_15_Top_Flashlight_OD_L[] = {"CUP_acc_ANPEQ_15_OD_Top", "CUP_acc_Flashlight_wdl", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert"};
            CUP_acc_ANPEQ_15_Top_Flashlight_OD_V[] = {"CUP_acc_ANPEQ_15_OD_Top_V", "CUP_acc_Flashlight_wdl", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert"};

            CUP_acc_ANPEQ_15_Flashlight_Black_L[] = {"CUP_acc_ANPEQ_15_Black", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Flashlight_Black_V[] = {"CUP_acc_ANPEQ_15_Black_V", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Top_Flashlight_Black_L[] = {"CUP_acc_ANPEQ_15_Black_Top", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Top_Flashlight_Black_V[] = {"CUP_acc_ANPEQ_15_Black_Top_V", "CUP_acc_Flashlight", "CUP_acc_Flashlight_desert", "CUP_acc_Flashlight_wdl"};
        };
    };
    class Disassemble
    {
        class Components
        {
            // All recipes from Assemble class will be used to add Disassble actions, some extra recipes may be defined here
            CUP_acc_ANPEQ_15_Flashlight_Tan_F[] = {"CUP_acc_ANPEQ_15", "CUP_acc_Flashlight_desert"};
            CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F[] = {"CUP_acc_ANPEQ_15_Tan_Top", "CUP_acc_Flashlight_desert"};
            CUP_acc_ANPEQ_15_Flashlight_OD_F[] = {"CUP_acc_ANPEQ_15_OD", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Top_Flashlight_OD_F[] = {"CUP_acc_ANPEQ_15_OD_Top", "CUP_acc_Flashlight_wdl"};
            CUP_acc_ANPEQ_15_Flashlight_Black_F[] = {"CUP_acc_ANPEQ_15_Black", "CUP_acc_Flashlight"};
            CUP_acc_ANPEQ_15_Top_Flashlight_Black_F[] = {"CUP_acc_ANPEQ_15_Black_Top", "CUP_acc_Flashlight"};
        };
    };

    class PrimaryHandgunTransform
    {
        class Components
        {
            CUP_smg_MP7 = "CUP_hgun_MP7";
            CUP_smg_MP7_desert = "CUP_hgun_MP7_desert";
            CUP_smg_MP7_woodland = "CUP_hgun_MP7_woodland";
        };
    };
};
