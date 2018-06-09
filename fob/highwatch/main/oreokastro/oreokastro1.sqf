// ------ Capture d'officier Oreokastro -----
// Author : [LM]Stark
// Date   : 03/09/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_oreokastro1 = createMarker ["marker_oreokastro1", [4840,21919]]; "marker_oreokastro1" setMarkerType "Empty";
[WEST,["task_oreokastro1"],["Un officier KICC a été repéré au <marker name='marker_oreokastro1'>château de Thronos</marker>. Cet officier est responsable de la mise en place d'un poste logistique dans la zone de <marker name='marker_fob_highwatch'>Highwatch</marker>. Votre objectif est sa capture car ses renseignements sont précieux.", "Capture d'officier", "marker_oreokastro1"],"marker_oreokastro1",true,1,true] call BIS_fnc_taskCreate;
["task_oreokastro1","target"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_oreokastro1";
LM_MISSION_POSITION = getMarkerPos "marker_oreokastro1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Création de l'environnement
_object = ["Land_SatelliteAntenna_01_F",[4891.48,21926,0],280,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["CargoNet_01_barrels_F",[4884.82,21882.2,0],120,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["CargoNet_01_barrels_F",[4882.71,21881.5,0],90,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["CargoNet_01_box_F",[4882.79,21883.3,0],0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["O_CargoNet_01_ammo_F",[4883.47,21885.4,0],112,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["O_CargoNet_01_ammo_F",[4885.69,21886.7,0],83,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Portable_generator_F",[4892.1,21926.9,0],0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Portable_generator_F",[4872.25,21934.5,0],212,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Portable_generator_F",[4866.52,21880.6,0],252,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Laptop_F",[4886.99,21921.4,0.779236],111,"",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_PortableLight_double_F",[4891.43,21927.9,0],144,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_PortableLight_double_F",[4871.13,21934.6,0],356,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_PortableLight_double_F",[4866.88,21881.7,0],273,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CampingTable_F",[4887.17,21921.6,-0.0285034],118,"",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["MapBoard_altis_F",[4890.64,21922.6,0],80,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

_truck = ["KICC_TEMPEST",[4891.91,21880.3,0],122,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _truck setVehicleLock "LOCKED"; _mission_object_array pushback _truck;
_truck = ["KICC_TEMPEST_MEDIC",[4892.88,21867.5,0],251,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _truck setVehicleLock "LOCKED"; _mission_object_array pushback _truck;
_truck = ["KICC_TEMPEST_AMMO",[4885.19,21874.6,0],268,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _truck setVehicleLock "LOCKED"; _mission_object_array pushback _truck;

//Objectif
oreokastro1_leader_opfor = (createGroup east) createUnit ["KICC_OFFICIER",[4888.41,21918.5,0], [], 0, "NONE"]; _mission_unit_array pushback oreokastro1_leader_opfor;
removeAllWeapons oreokastro1_leader_opfor;
[oreokastro1_leader_opfor, true] call ACE_captives_fnc_setHandcuffed;

//Gardes
_group = [[4886.87,21928.4,0], east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "specfor")] call BIS_fnc_spawnGroup; _group deleteGroupWhenEmpty true;
_group setFormation "FILE";
{_mission_unit_array pushback _x}forEach (units _group);

//Déclencheur officier
_trigger_officier = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_officier triggerAttachVehicle [oreokastro1_leader_opfor];
_trigger_officier setTriggerArea [2, 3, 23, true];
_trigger_officier setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_officier setTriggerStatements ["this", "LM_COMMANDER setVariable ['oreokastro1_reussite', true, false];", ""];

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	if(!alive oreokastro1_leader_opfor) then { LM_COMMANDER setVariable ["oreokastro1_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "oreokastro1_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x} forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x} forEach _mission_unit_array;
["task_oreokastro1", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "oreokastro1_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_oreokastro1";
LM_COMMANDER setVariable ['oreokastro1_reussite', nil];
deleteVehicle _trigger_officier;

// ... end of mission's code, do not edit any of the lines bellow.