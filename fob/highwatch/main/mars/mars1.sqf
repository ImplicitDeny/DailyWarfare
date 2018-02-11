// ------ OPERATION MARS -----
// Author : [LM]epicfail867
// Date   : 21/02/17
// Team   : La Muerta

//Création du marker
marker_mars1 = createMarker ["marker_mars1", [8554,20905]]; "marker_mars1" setMarkerType "Empty";
[west,["task_mars1"],["Nos rapports indiquent qu'un officier KICC notoire est présent dans les <marker name='marker_mars1'>montagnes au nord-ouest</marker>. Il semble que le KICC cherche à réorganiser ses lignes de défenses dans les montagnes afin d'établir un point de débarquement sécurisé pour de futurs renforts maritimes. Eliminer cet officier leur fera à coup sûr perdre un temps précieux. Occupez-vous de cela.","Opération Mars","marker_mars1"],"marker_mars1",true,2,true] call BIS_fnc_taskCreate;
["task_mars1","kill"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_mars1";
LM_MISSION_POSITION = getMarkerPos "marker_mars1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Champ de tir
_object = ["Target_PopUp_Moving_Acc2_F",[8479.53,20894.6,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Target_PopUp_Moving_Acc2_F",[8478.39,20897.2,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Target_PopUp_Moving_Acc2_F",[8477.14,20899.7,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Target_PopUp_Moving_Acc2_F",[8475.87,20902.2,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Target_PopUp_Moving_Acc2_F",[8480.95,20891.8,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Target_PopUp_Moving_Acc2_F",[8482.27,20889,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Target_PopUp_Moving_Acc2_F",[8483.71,20885.9,0],243,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//RéserveMunitions
_object = ["Box_East_WpsSpecial_F",[8539.72,20844.3,0.985695],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Box_East_Wps_F",[8541.13,20845.3,0.904884],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["O_supplyCrate_F",[8540.38,20843.4,0.867836],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["O_supplyCrate_F",[8541.75,20844.3,0.787354],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Poste médical
_object = ["ACE_medicalSupplyCrate_advanced",[8547.59,20847.4,0.413101],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["ACE_medicalSupplyCrate_advanced",[8548.63,20848,0.373833],328,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Sleeping_bag_blue_F",[8545.82,20851.8,0.995148],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Sleeping_bag_blue_F",[8546.96,20852.5,0.995735],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_Sleeping_bag_blue_F",[8548.31,20853.4,0.971611],326,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Item_Medikit",[8544.84,20851.8,1.02018],0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Véhicules vides verrouillés
_vehicle = ["KICC_ORCA_ARMED",[8583,20928,0],244,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _vehicle setVehicleLock "LOCKED"; _mission_object_array pushback _vehicle;

//Objectif
mars_leader_opfor = (createGroup east) createUnit ["KICC_OFFICIER", [8550.59,20885.1,3.13612], [], 0, "NONE"]; _mission_unit_array pushback mars_leader_opfor;
mars_leader_opfor disableAI "MOVE";
mars_leader_opfor disableAI "PATH";

//Gardes
_position_array = [[8550.79,20882.8,0.173111],[8552.19,20890.1,3.37008]];
_direction_array = [0,240];
for "_i" from 0 to ((count _position_array)-1) do {
	_group = createGroup EAST; _group deleteGroupWhenEmpty true;
	_position = _position_array select _i;
	_direction = _direction_array select _i;
	_unit = _group createUnit ["KICC_SPECFOR", _position, [], 0, "NONE"];
	_unit setPosATL _position;
	_unit setDir _direction;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit;
};

//En hauteur
_position_array = [[8554.79,20890.2,3.37],[8638.22,20791.5,3.30385],[8517.46,20936.1,3.49361]];
_direction_array = [65,170,315];
_random_position_sniper = floor(random 3);
_group = createGroup EAST; _group deleteGroupWhenEmpty true;
_position = _position_array select _random_position_sniper;
_direction = _direction_array select _random_position_sniper;
_unit = _group createUnit ["KICC_TIREUR_PRECISION", _position, [], 0, "NONE"];
_unit setPosATL _position;
_unit setDir _direction;
_unit disableAI "PATH";
_mission_unit_array pushback _unit;

//Champ de tir
_group = [[8513.45,20907.8,0], east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup; _group deleteGroupWhenEmpty true;
_group setFormation "LINE";
{_mission_unit_array pushback _x}forEach (units _group);

//Pilotes hélicoptère
_position_array = [[8580.26,20924.8,0],[8580.8,20929.7,0]];
_direction_array = [244,318];
for "_i" from 0 to ((count _position_array)-1) do {
	_group = createGroup EAST; _group deleteGroupWhenEmpty true;
	_position = _position_array select _i;
	_direction = _direction_array select _i;
	_unit = _group createUnit ["KICC_PILOTE_HELI", _position, [], 0, "NONE"];
	_unit setPosATL _position;
	_unit setDir _direction;
	_mission_unit_array pushback _unit;
};

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	!(alive mars_leader_opfor)
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x} forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x} forEach _mission_unit_array;
deleteMarker "marker_mars1";
["task_mars1", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;

// ... end of mission's code, do not edit any of the lines bellow.