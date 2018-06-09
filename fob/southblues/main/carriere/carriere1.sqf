// ------ TRAFIC CARRIERE -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_carriere1 = createMarker ["marker_carriere1", [17075,11315]]; "marker_carriere1" setMarkerType "Empty";
[WEST,["task_carriere1"],["Une rencontre doit avoir lieu entre des dirigeants KICC et une faction armée hostile. Profitez de l'occasion pour porter un rude coup à deux de nos adversaires en éliminant toute menace ou matériel rencontré sur zone. Attention toutefois, le KICC a soigneusement sécurisé la zone, de nombreuses unités ont été déployées.", "D'une pierre deux coups", "marker_carriere1"],"marker_carriere1",true,1,true] call BIS_fnc_taskCreate;
["task_carriere1","target"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_carriere1";
LM_MISSION_POSITION = getMarkerPos "marker_carriere1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Véhicules vides verrouillés
_vehicle = ["C_Van_01_transport_F",[17074.89,11355.694,0],32.435,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _vehicle setVehicleLock "LOCKED"; _mission_object_array pushback _vehicle;
_vehicle = ["C_Van_01_transport_F",[17078.076,11348.203,0],49.424,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _vehicle setVehicleLock "LOCKED"; _mission_object_array pushback _vehicle;

//Objectifs
carriere1_ammo_0 = ["KICC_TEMPEST_AMMO",[17054.213,11360.811,0],322.456,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; carriere1_ammo_0 setVehicleLock "LOCKED"; _mission_object_array pushback carriere1_ammo_0;
carriere1_ammo_1 = ["KICC_TEMPEST_AMMO",[17065.924,11365.929,0],347.855,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; carriere1_ammo_1 setVehicleLock "LOCKED"; _mission_object_array pushback carriere1_ammo_1;
carriere1_leader_opfor = (createGroup EAST) createUnit ["KICC_TL", [17065.156,11353.896,0], [], 0, "NONE"]; carriere1_leader_opfor setDir 157.259; _mission_unit_array pushback carriere1_leader_opfor;
carriere1_leader_independent = (createGroup independent) createUnit ["I_G_officer_F", [17066.043,11350.407,0], [], 0, "NONE"]; carriere1_leader_independent setDir 323.337; _mission_unit_array pushback carriere1_leader_independent;

//Véhicules
//OPFOR
_vehicle = [EAST,"KICC_IFRIT_HMG",selectRandom[[17126.506,11265.892,0],[16999.09,11327.699,0]],random 360] call LM_fnc_createVehicle; _mission_object_array pushback _vehicle; {_mission_unit_array pushback _x}forEach (crew _vehicle);
_vehicle = [EAST,"KICC_IFRIT",[17086.09,11366.126,0],101.882] call LM_fnc_createVehicle; _vehicle setFuel 0; _mission_object_array pushback _vehicle; {_mission_unit_array pushback _x}forEach (crew _vehicle);
_group = [position _vehicle, east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "patrouille")] call BIS_fnc_spawnGroup; _group deleteGroupWhenEmpty true; {_mission_unit_array pushback _x; _x moveInCargo _vehicle;}forEach (units _group);
//IND
_vehicle = [independent,"I_G_Offroad_01_armed_F",selectRandom[[17115.78,11386.913,0],[17127.049,11344.525,0]],random 360] call LM_fnc_createVehicle; _mission_object_array pushback _vehicle; {_mission_unit_array pushback _x}forEach (crew _vehicle);
_vehicle = [independent,"I_G_Offroad_01_armed_F",selectRandom[[17087.701,11202.961,0],[17077.387,11159.062,0]],random 360] call LM_fnc_createVehicle; _mission_object_array pushback _vehicle; {_mission_unit_array pushback _x}forEach (crew _vehicle);
_vehicle = [independent,"C_Offroad_01_F",[17059.852,11344.746,0],282.379] call LM_fnc_createVehicle; _vehicle setFuel 0; _mission_object_array pushback _vehicle; {_mission_unit_array pushback _x}forEach (crew _vehicle);
_group = createGroup independent;
_group deleteGroupWhenEmpty true;
_unit_type_array = ["I_G_medic_F","I_G_soldier_GL_F","I_G_soldier_AR_F","I_G_soldier_TL_F"];
for "_i" from 0 to 3 do {_group createUnit [_unit_type_array select _i, position _vehicle, [], 0, "NONE"];};{_mission_unit_array pushback _x; _x moveInCargo _vehicle;}forEach (units _group);


//----------Boucle principale----------
waitUntil
{
	!(alive carriere1_ammo_0) and
	!(alive carriere1_ammo_1) and
	!(alive carriere1_leader_opfor) and
	!(alive carriere1_leader_independent)
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x} forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x} forEach _mission_unit_array;
deleteMarker "marker_carriere1";
["task_carriere1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.