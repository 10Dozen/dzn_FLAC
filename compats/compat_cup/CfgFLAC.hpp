
// Common FLAC classes for pointers

// Rules to adjust top mount pointers to default positions
class FLAC_Pointers_Top_To_Side_Options
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

    /* TBD
    CUP_acc_ANPEQ_2_Flashlight_Black_L -- Anpeq2 has no side-side version
    */
};

// Rules to adjust side-to-side mount to cross mount positions
class FLAC_Pointers_SideToSide_To_Cross_Options
{
    CUP_acc_ANPEQ_15_Flashlight_Tan_L = "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L";
    CUP_acc_ANPEQ_15_Flashlight_Tan_F = "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_F";
    CUP_acc_ANPEQ_15_Flashlight_Tan_V = "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_V";
    CUP_acc_ANPEQ_15_Flashlight_OD_L = "CUP_acc_ANPEQ_15_Top_Flashlight_OD_L";
    CUP_acc_ANPEQ_15_Flashlight_OD_F = "CUP_acc_ANPEQ_15_Top_Flashlight_OD_F";
    CUP_acc_ANPEQ_15_Flashlight_OD_V = "CUP_acc_ANPEQ_15_Top_Flashlight_OD_V";
    CUP_acc_ANPEQ_15_Flashlight_Black_L = "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L";
    CUP_acc_ANPEQ_15_Flashlight_Black_F = "CUP_acc_ANPEQ_15_Top_Flashlight_Black_F";
    CUP_acc_ANPEQ_15_Flashlight_Black_V = "CUP_acc_ANPEQ_15_Top_Flashlight_Black_V";
};

// Common FLAC classes for optics
// Rules to adjust rear mount optics to forward poistion
class FLAC_Optics_RailRear_To_RailForward_Options
{
    CUP_optic_SUSAT = "CUP_optic_SUSAT_3D";
    CUP_optic_SUSAT_PIP = "CUP_optic_SUSAT_3D";
};

// Rules to adjust forward mount optics to default position
class FLAC_Optics_RailForward_To_RailRear_Options {};

// Rules to adjust dovetail mount optics (with adapter) to RIS mount
class FLAC_Optics_Dovetail_To_Rail_Options {};

// Rules to adjust optics from rail mount to dovetail (using adapter) mount
class FLAC_Optics_Rail_To_Dovetail_Options {};
