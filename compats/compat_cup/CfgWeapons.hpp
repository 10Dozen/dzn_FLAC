class CfgWeapons
{

	class CUP_arifle_AKS74U;
	class CUP_arifle_AKS74U_railed: CUP_arifle_AKS74U
	{
		class FLAC_Optics: FLAC_Optics_RailRear_To_RailForward_Options {};
		class FLAC_Pointers: FLAC_Pointers_Top_To_Side_Options {};
	};

	class CUP_arifle_G36_Base_CarryhandleOptics;
	class CUP_arifle_G36K: CUP_arifle_G36_Base_CarryhandleOptics
	{
		class FLAC_Pointers: FLAC_Pointers_Top_To_Side_Options {};
	};

};
