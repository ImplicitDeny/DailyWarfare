// ------ Opération Saltstorm -----
// Author : [LM]Syh
// Team   : La Muerta

marker_almyra1 = createMarker ["marker_almyra1", [23338,16784,0]]; "marker_almyra1" setMarkerType "Empty";
[WEST,["task_almyra1_main"],["Le <marker name='marker_almyra1'>lac salé d'Almyra</marker> peut vous sembler être une zone vide de tout intérêt mais elle offre pourtant un environnement visuel et radar très dégagé. Le KICC l'a bien compris et s'y est installé. Ils ont mis en place des moyens antiaériens lourds et cela rend la zone inopérable pour nos appareils aériens. Rendez vous là-bas et neutralisez leurs équipements Sol-Air.", "Opération Saltstorm", "marker_almyra1"],[23338,16784,0],true,1,true,"destroy"] call BIS_fnc_taskCreate;
LM_MISSION_MAIN_TASK = "task_almyra1_main";
LM_MISSION_POSITION = getMarkerPos "marker_almyra1";
LM_MISSION_POPULATE = [true, true, true, true, true, 60, false];

//Initialisation du tableau de suppression
_mission_unit_array = [];

//FortainNord
_object = ["Land_CncBarrier_F",[23410.5,17528.311,0],259.376,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_1_F",[23370.115,17513.281,2.117],349.226,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F",[23390.148,17546.51,0],350.943,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F",[23401.129,17531.881,0],81.510,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F",[23403.398,17521.826,0],76.895,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F",[23397.465,17511.654,0],169.499,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F",[23374.83,17543.604,0],350.276,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F",[23369.54,17517.113,0],83.056,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corridor_F",[23405.383,17527.488,0],352.887,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["CamoNet_OPFOR_open_F",[23405.076,17528.53,0.222],84.306,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_House_V3_F",[23376.928,17538.318,0],350.693,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F",[23383.107,17541.617,0],170.116,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F",[23372.924,17511.137,0],351.597,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Short_F",[23405.633,17534.980,0],173.783,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_End_F",[23403.807,17535.104,0],348.466,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Long_F",[23407.105,17531.648,0],260.975,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F",[23406.254,17534.311,0],225.443,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F",[23397.43,17545.814,0],352.707,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F",[23403.145,17514.555,0],79.188,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F",[23369.125,17540.311,0],265.386,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F",[23398.844,17539.96,0],83.971,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F",[23388.848,17511.715,0],170.243,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F",[23380.76,17510.107,0],172.509,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F",[23369.54,17525.469,0],263.409,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F",[23369.36,17533.396,0],276.399,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_Patrol_V3_F",[23397.025,17534.246,0],268.894,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_HQ_V3_F", [23384.602,17526.438,0],262.527,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingTable_F", [23378.06,17540.137,0.593],350.640,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Laptop_unfolded_F", [23378.676,17540.371,1.406],329.721,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_File1_F", [23378.254,17540.197,1.406],7.900,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;


//FortainEst
_object = ["Land_CncBarrier_F", [23847.4,17002.045,0.017],60.600,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_1_F", [23880.799,17029.273,2.088],237.765,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23872.527,16991.368,0.027],152.167,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23857.422,17001.682,0.015],242.734,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23852.037,17010.47,0.016],238.119,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23854.38,17022.01,0.028],330.723,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23886.096,16999.047,0.014],151.5,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23882.576,17025.83,0],244.279,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corridor_F", [23851.98,17004.47,0.025],154.111,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["CamoNet_OPFOR_open_F", [23852.607,17003.584,0.246],245.530,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_House_V3_F", [23882.408,17003.375,0.017],151.916,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23877.62,16998.264,0.013],331.340,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23877.45,17030.4,0],152.820,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Short_F", [23856.996,16998.262,0.027],335.007,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_End_F", [23855.924,16997.768,0.027],149.689,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Long_F", [23851.69,16999.977,0.017],62.199,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23853.352,16997.730,0.028],26.667,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23865.41,16989.68,0.033],153.931,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23849.938,17017.436,0.005],240.412,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23890.438,17004.002,0.018],66.610,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23862.186,16994.768,0.027],245.194,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23862.56,17024.727,0.007],331.467,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23869.7,17028.852,0],333.732,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23885.268,17017.92,0],64.633,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23887.99,17010.473,0],77.623,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_Patrol_V3_F", [23862.07,17000.762,0.017],70.118,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_HQ_V3_F", [23871.32,17012.154,0],63.751,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingTable_F", [23881.86,17001.33,0.605],151.582,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingChair_V2_F", [23882.006,17000.334,0.714],151.591,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Laptop_unfolded_F", [23881.465,17001.064,1.434],126.870,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_File1_F", [23881.979,17001.33,1.411],162.163,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;


//FortainSud
_object = ["Land_CncBarrier_F", [23514.67,16356.74,0], 142.797,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_1_F", [23546.18,16327.349,2.180], 319.963,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23507.5,16330.397,0], 234.364,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23515.672,16346.762,0], 324.931,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23523.646,16353,0], 320.316,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23535.4,16352.536,0], 52.920,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23516.953,16317.997,0], 233.697,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23543.01,16325.12,0], 326.477,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corridor_F", [23517.697,16352.531,0], 236.308,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["CamoNet_OPFOR_open_F", [23516.902,16351.792,0.222], 327.727,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_House_V3_F", [23520.742,16322.238,0.266], 234.114,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23515.027,16326.288,0], 53.537,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23546.842,16330.819,0], 235.018,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Short_F", [23512.227,16346.722,0], 57.204,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_End_F", [23511.59,16347.716,0], 231.887,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Long_F", [23513.205,16352.21,0], 144.396,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23511.203,16350.258,0], 108.684,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23504.865,16337.218,0], 236.128,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23530.264,16356.315,0], 322.609,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23522.451,16314.37,0], 148.807,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23509.47,16341.103,0], 327.391,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23539.201,16344.802,0], 53.664,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23544.258,16338.288,0], 55.930,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23535.54,16321.381,0], 146.830,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23528.53,16317.673,0], 159.820,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_Patrol_V3_F", [23515.39,16342.035,0], 152.315,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_HQ_V3_F", [23527.934,16334.417,0.425], 145.948,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingTable_F", [23518.549,16322.522,0.774], 234.244,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingChair_V2_F", [23517.525,16322.22,0.891], 231.913,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Laptop_unfolded_F", [23518.201,16322.935,1.562], 215.391,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_File1_F", [23518.521,16322.632,1.582], 244.908,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;

//FortainOuest
_object = ["Land_CncBarrier_F", [22878.64,16414.785,0.012], 217.459,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_1_F", [22858.629,16376.622,2.198], 34.625,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [22851.338,16414.730,0], 309.027,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [22869.28,16411.182,0], 39.594,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [22877.688,16405.215,0.008], 34.979,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [22880.066,16393.684,0], 127.582,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [22841.88,16402.336,0.010], 308.360,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [22855.64,16379.09,0.043], 41.139,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corridor_F", [22875.38,16410.754,0], 310.971,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["CamoNet_OPFOR_open_F", [22874.457,16411.324,0.221], 42.389,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_House_V3_F", [22846.973,16399.805,0.002], 308.776,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [22849.367,16406.387,0], 128.200,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [22862.15,16376.903,0.043], 309.680,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Short_F", [22868.33,16414.492,0], 131.867,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_End_F", [22869.121,16415.367,0], 306.549,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Long_F", [22873.883,16415,0], 219.058,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [22871.47,16416.414,0], 183.526,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [22857.22,16419.078,0.006], 310.790,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [22882.355,16399.635,0], 37.272,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [22839.834,16396.074,0.012], 223.469,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [22862.184,16415.666,0], 42.054,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [22873.613,16387.97,0.013], 128.327,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [22868.67,16381.372,0.017], 130.592,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [22850.06,16385.307,0.037], 221.493,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [22844.629,16391.086,0.033], 234.482,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_Patrol_V3_F", [22864.646,16410.2,0], 226.978,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_HQ_V3_F", [22860.62,16396.09,0], 220.611,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingTable_F", [22846.729,16401.986,0.626], 307.221,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingChair_V2_F", [22846.09,16402.756,0.780], 307.599,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Laptop_unfolded_F", [22846.98,16402.416,1.428], 290.242,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_File1_F", [22846.793,16401.986,1.459], 0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;

//FortainMain
_object = ["Land_BarGate_F", [23292.656,16762.465,0], 250.760,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23289.322,16769.215,0], 66.238,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_5_F", [23297.021,16770.861,0], 68.142,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23292.248,16773.086,0], 157.855,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23292.805,16779.361,0], 246.614,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23291.299,16788.006,0], 249.908,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23289.162,16794.555,0], 254.029,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23294.533,16798.129,0],341.948 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23302.693,16797.973,0], 163.019,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23309.31,16802.244,0], 343.856,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23317.123,16805.896,0], 159.941,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23325.18,16809.168,0], 338.420,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23333.42,16811.377,0], 340.508,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23339.908,16814.418,0], 335.081,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall4_F", [23343.742,16810.805,0],44.719 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23350.11,16807.145,0],233.935 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23355.357,16800.256,0],54.796 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23359.97,16793.254,0],239.194 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23359.674,16786.584,0],149.085 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23352.44,16782.229,0],331.293 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23353.625,16811.072,0],321.393 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall_corner_F", [23358.764,16815.713,0],324.153 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23365.133,16814.230,0],232.054 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_3_F", [23369.049,16819.625,0],146.942 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagBunker_Small_F", [23371.738,16817.889,0],235.519 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23375.75,16816.84,0],228.141 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BarGate_F", [23378.635,16811.988,0],54.642 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Long_F", [23382.822,16806.980,0],233.149 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23384.13,16804.56,0],260.388 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23383.746,16801.926,0],79.875 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Round_F", [23384.607,16799.748,0],256.543 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_5_F", [23382.576,16796.197,0],321.892 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23375.53,16802.842,0],140.051 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23375.81,16796.205,0.310],53.913 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23381.963,16790.123,0],235.068 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23387.307,16783.553,0],49.430 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23385.61,16777.166,0],141.4 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23379.117,16771.457,0],140.053 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23372.635,16772.967,0],57.899 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23372.805,16765.539,0],136.246 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23365.451,16761.22,0],149.256 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23358.633,16755.520,0],331.692 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23350.057,16754.918,0],331.680 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23344.844,16748.182,0],153.229 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23336.334,16746.768,0],165.250 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23328.412,16744.25,0],163.656 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23320.926,16742.563,0],213.075 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23312.434,16743.842,0],344.277 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23304.25,16740.967,0],161.140 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierWall6_F", [23300.965,16745.416,0],252.737 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23301.1,16751.184,0],341.230 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_5_F", [23303.43,16756.248,0],71.099 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_3_F", [23301.887,16760.424,0],248.615 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagFence_Long_F", [23296.596,16752.262,0],69.170 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_BagBunker_Small_F", [23297.21,16756.219,0],71.654 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_Patrol_V3_F", [23295.924,16776.252,0],67.626 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23318.252,16786.996,0],158.992 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23314.27,16781.908,0],248.357 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HbarrierTower_F", [23320.996,16776.268,0],67.712 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Hbarrier_Big_F", [23321.025,16767.879,0],244.387 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_HBarrier_Big_F", [23327.54,16767.482,0],333.675 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_HQ_V3_F", [23330.754,16760.33,0.628],333.743 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_House_V3_F", [23355.836,16760.81,0],151.722 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingTable_F", [23355.246,16758.711,0.593],331.629 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_CampingChair_V2_F", [23355.477,16757.688,0.734],150.887 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Laptop_unfolded_F", [23354.867,16758.451,1.411],125.910 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_File1_F", [23355.186,16758.74,1.410],156.161 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_House_V3_F", [23368.357,16770.389,0],143.603 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;
_object = ["Land_Cargo_Patrol_V3_F", [23383.514,16780.988,0],232.928 ,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; LM_MISSION_TEMP pushback _object;

//Véhicules vides verrouillés
_vehicle = ["KICC_OFFROAD_ARMED", [23321.506,16783.824,0], 70.517,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _vehicle lock true; LM_MISSION_TEMP pushback _vehicle;
_vehicle = ["KICC_IFRIT", [0,0,0], 61.005,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _vehicle setPosATL [23327.598,16772.730,0]; _vehicle lock true; LM_MISSION_TEMP pushback _vehicle;


//Objectifs
ObjTIGRIS = "KICC_TIGRIS" createVehicle [0,0,0]; createVehicleCrew ObjTIGRIS;
ObjTIGRIS setDir 237.954;
ObjTIGRIS setPosATL [23352.963,16788.416,0];
ObjTIGRIS forceSpeed 0;
ObjTIGRIS_2 = "KICC_TIGRIS" createVehicle [0,0,0]; createVehicleCrew ObjTIGRIS_2;
ObjTIGRIS_2 setDir 237.954;
ObjTIGRIS_2 setPosATL [23348.328,16795.768,0];
ObjTIGRIS forceSpeed 0;



//Spawn IA
_type_array = [/*InfanterieNord*/ "KICC_TL","KICC_TIREUR_PRECISION","KICC_FUSILIER","KICC_FUSILIER_AUTO","KICC_FUSILIER","KICC_GRENADIER","KICC_MEDIC","KICC_TITAN_AC",
/*InfanterieEst*/ "KICC_GRENADIER","KICC_TIREUR_PRECISION","KICC_TL","KICC_FUSILIER_AUTO","KICC_FUSILIER","KICC_FUSILIER","KICC_TITAN_AC","KICC_MEDIC",
/*InfanterieSud*/ "KICC_FUSILIER","KICC_MEDIC","KICC_FUSILIER","KICC_GRENADIER","KICC_TL","KICC_TIREUR_PRECISION","KICC_FUSILIER_AUTO","KICC_TITAN_AC",
/*InfanterieOuest*/ "KICC_FUSILIER","KICC_GRENADIER","KICC_FUSILIER","KICC_FUSILIER_AUTO","KICC_TIREUR_PRECISION","KICC_MEDIC","KICC_TITAN_AC","KICC_TL",
/*InfanterieMain*/ "KICC_FUSILIER","KICC_FUSILIER_AUTO","KICC_FUSILIER","KICC_TIREUR_PRECISION","KICC_FUSILIER","KICC_TL","KICC_MEDIC","KICC_FUSILIER","KICC_MEDIC",
"KICC_GRENADIER","KICC_OP_RADIO","KICC_TITAN_AA","KICC_SL","KICC_TITAN_AC","KICC_TIREUR_PRECISION","KICC_FUSILIER"];
_position_array = [/*InfanterieNord*/ [23375.803,17538.607,0.593],[23382.842,17542.71,2.280],[23397.678,17546.05,1.246],[23398.078,17535.5,4.344],[23403.986,17534.148,0],[23405.283,17533.086,0],[23373.47,17508.875,2.280],[23369.873,17523.9,1.195],
/*InfanterieEst*/ [23877.746,17031.076,2.281],[23873.54,17014.535,3.116],[23854.06,17000.889,0],[23862.494,16999.406,4.322],[23884.322,17002.826,0.495],[23887.824,17010.879,1.208],[23885.93,17016.42,1.225],[23877.967,16997.16,2.293],
/*InfanterieSud*/ [23530.6,16356.945,1.267],[23540.75,16343.515,1.213],[23547.76,16330.688,2.280],[23523.313,16314.802,1.248],[23513.965,16325.214,2.240],[23513.598,16342.821,4.317],[23512.49,16349.129,0],[23525.295,16329.847,3.579],
/*InfanterieOuest*/ [22864.688,16412.016,4.357],[22871.596,16414.957,0],[22872.96,16413.25,0],[22862.875,16376.534,2.323],[22848.326,16407.22,2.280],[22855.928,16398.277,0.558],[22853.957,16394.857,3.018],[22856.434,16396.773,0.573],
/*InfanterieMain*/ [23355.244,16812.482,1.488],[23371.793,16818.58,0],[23383.895,16782.563,4.337],[23382.342,16780.520,4.341],[23365.877,16761.514,1.213],[23358.14,16758.346,0.726],[23350.965,16753.277,2.280],[23349.46,16754.01,2.280],
[23300.295,16746.867,1.203],[23294.107,16777.027,4.349],[23302.352,16799.104,2.277],[23308.63,16802.19,1.244],[23342.297,16812.229,1.250],[23329.605,16762.363,3.747],[23329.453,16758.578,3.773],[23320.555,16775.266,2.280]];
_direction_array = [/*InfanterieNord*/ 85.775,351.469,354.479,57.896,8.372,70.599,169.824,288.253,
/*InfanterieEst*/ 59.119,37.663,237.394,166.413,295.141,82.271,71.413,147.577,
/*InfanterieSud*/ 8.416,62.966,130.453,161.436,227.276,283.884,301.127,139.545,
/*InfanterieOuest*/ 341.732,354.412,23.533,226.7,267.983,123.207,262.160,346.486,
/*InfanterieMain*/ 315.144,52.628,56.182,51.843,136.926,308.695,149.949,171.870,237.763,262.211,333.900,339.900,21.095,280.343,221.361,178.807];
for "_i" from 0 to ((count _position_array)-1) do {
	_group = createGroup [EAST, true];
	_type = _type_array select _i;
	_position = _position_array select _i;
	_direction = _direction_array select _i;
	_unit = _group createUnit [_type, _position, [], 0, "CAN_COLLIDE"];
	_unit setDir _direction;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit;
};

//----------Boucle principale----------
waitUntil{ sleep 5; !alive ObjTIGRIS and !alive ObjTIGRIS_2 };

//----------Suppression de l'environnement----------
deleteMarker "marker_almyra1";
["task_almyra1_main", "SUCCEEDED"] call BIS_fnc_taskSetState;