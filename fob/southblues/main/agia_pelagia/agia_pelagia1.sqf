// ------ LOGISTIQUE AGIA PELAGIA -----
// Author : [LM]Stark
// Date   : 23/03/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
//Création du marker
marker_agia_pelagia1 = createMarker ["marker_agia_pelagia1", [23065,7280]]; "marker_agia_pelagia1" setMarkerType "Empty";
[west,["task_agia_pelagia1"],["Le KICC rassemble des forces au sud-est de l'île. Quoi qu'ils aient en tête, ne les laissez pas faire : détruisez tout le matériel et tous les véhicules rencontrés sur place.","Rassemblement suspect","marker_agia_pelagia1"],"marker_agia_pelagia1",true,2,true] call BIS_fnc_taskCreate;
["task_agia_pelagia1","attack"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_agia_pelagia1";
LM_MISSION_POSITION = getMarkerPos "marker_agia_pelagia1";

//Initialisation du tableau de suppression
_mission_object_array = [];

//Décor
_object = ["Land_BarGate_F",[22993.7,7247.91,0],64.096,"",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Cargo_Patrol_V2_F",[23121.2,7345.65,0],235.392,"",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Cargo_Patrol_V2_F",[23101,7244.77,0],305.535,"",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Cargo_HQ_V2_F",[23033.9,7230.97,0],55.435,"",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Communication_F",[23015,7272.29,0],145.709,"",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Cloture
_object = ["Land_HBarrier_1_F",[23034.8,7190.39,1.43739],0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_1_F",[23034.6,7190.43,0],0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall4_F",[23133.6,7367.65,0],42.497,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall4_F",[23060.2,7335.46,0],330.948,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall4_F",[23055.7,7332.62,0],326.766,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall4_F",[23094,7230.51,0],128.846,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall4_F",[23133.9,7311.32,0],115.418,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23138.7,7362.92,0],42.858,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23128.2,7371.96,0],40.005,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23065.9,7339.55,0],324.847,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23049.9,7328.68,0],330.402,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23089.5,7225.49,0],138.03,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23030.2,7192.56,0],192.167,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[23130.6,7305.38,0],124.602,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrierWall6_F",[22988,7298.06,0],337.75,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Véhicules vides verrouillés
_kajman = ["KICC_KAJMAN",[23079.5,7298.8,0],46.316,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _kajman setVehicleLock "LOCKED"; _mission_object_array pushback _kajman;
_t100_0 = ["KICC_T100",[23088,7274.54,0],231.772,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _t100_0 setVehicleLock "LOCKED"; _mission_object_array pushback _t100_0;
_t100_1 = ["KICC_T100",[23091,7270.64,0],231.772,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _t100_1 setVehicleLock "LOCKED"; _mission_object_array pushback _t100_1;
_t100_2 = ["KICC_T100",[23094.3,7266.99,0],231.772,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _t100_2 setVehicleLock "LOCKED"; _mission_object_array pushback _t100_2;
_t100_3 = ["KICC_T100",[23097.4,7263.23,0],231.772,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _t100_3 setVehicleLock "LOCKED"; _mission_object_array pushback _t100_3;
_fuel_0 = ["KICC_TEMPEST_FUEL",[23011.6,7244.32,0],325,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _fuel_0 setVehicleLock "LOCKED"; _mission_object_array pushback _fuel_0;
_fuel_1 = ["KICC_TEMPEST_FUEL",[23016.1,7247.56,0],326,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _fuel_1 setVehicleLock "LOCKED"; _mission_object_array pushback _fuel_1;
_fuel_2 = ["KICC_TEMPEST_FUEL",[23020.6,7250.92,0],324,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _fuel_2 setVehicleLock "LOCKED"; _mission_object_array pushback _fuel_2;
_repair = ["KICC_TEMPEST_REPAIR",[23058.2,7250.36,0],48,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _repair setVehicleLock "LOCKED"; _mission_object_array pushback _repair;
_ammo_0 = ["KICC_TEMPEST_AMMO",[23044.6,7266.2,0],50,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _ammo_0 setVehicleLock "LOCKED"; _mission_object_array pushback _ammo_0;
_ammo_1 = ["KICC_TEMPEST_AMMO",[23041.3,7270.14,0],52,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _ammo_1 setVehicleLock "LOCKED"; _mission_object_array pushback _ammo_1;

//----------Boucle principale----------
waitUntil{!(alive _kajman or alive _t100_0 or alive _t100_1 or alive _t100_2 or alive _t100_3 or alive _fuel_0 or alive _fuel_1 or alive _fuel_2 or alive _repair or alive _ammo_0 or alive _ammo_1)};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x} forEach _mission_object_array;
deleteMarker "marker_agia_pelagia1";
["task_agia_pelagia1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;

// ... end of mission's code, do not edit any of the lines bellow.