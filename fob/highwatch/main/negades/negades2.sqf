// ------ Otages Negades -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_negades2 = createMarker ["marker_negades2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Negades" >> "position")]; "marker_negades2" setMarkerType "Empty";
negades2_liste_localisations = [[4955,16180,0],[4850,16180,0],[4910,16130,0]];
[WEST,["task_negades2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_negades2'>Negades</marker>, espérant s'en servir comme monnaie d'échange contre certains de leurs officiers que nous avons capturé. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Monnaie d'échange", "marker_negades2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_negades2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_negades2_hostage_a","task_negades2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(negades2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_negades2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_negades2_hostage_b","task_negades2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(negades2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_negades2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_negades2_hostage_c","task_negades2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(negades2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_negades2_hostage_c","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_negades2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_negades2";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[5043.98,16143.7,0],132.523,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[5047.22,16145.7,0],351.438,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[5044.42,16150.1,0],315.317,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[5041.34,16148.4,0],162.159,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[5041.41,16151.6,0],62.585,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[5047.42,16142.8,0],46.230,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage W
_object = ["Land_CncBarrier_F",[4749.54,16153.3,0],146.611,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[4753.18,16154.5,0],5.526,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[4751.67,16158.5,0],338.218,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[4748.18,16158.2,0],185.060,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[4749.49,16161.1,0],85.486,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[4752.66,16151.6,0],60.318,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

// Ajustement de la configuration
_type_array_gardes = ["KICC_TL","KICC_FUSILIER"];
_type_array_otages = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
_type_array_anim = ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02","ApanPknlMstpSnonWnonDnon_G03"];
_position_array_gardes = [];
_direction_array_gardes = [];
_position_array_otages = [];
_direction_array_otages = [];
switch (floor(random 3)) do {
    case 0: {
		_position_array_gardes = [[4959.57,16176.5,4.09132],[4961.6,16181,4.78281]];
		_direction_array_gardes = [309,0];
		_position_array_otages = [[4956.86,16179.6,4.41708],[4955.54,16178.3,4.16236]];
		_direction_array_otages = [150,120];
		LM_COMMANDER setVariable ['negades2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[4850.47,16178.1,3.97173],[4847.77,16183,4.81815]];
		_direction_array_gardes = [18,346];
		_position_array_otages = [[4853.56,16180.9,4.47407],[4851.78,16181.7,4.56274]];
		_direction_array_otages = [234,201];
		LM_COMMANDER setVariable ['negades2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[4914.5,16128.6,0.415779],[4907.47,16131.3,0.432266]];
		_direction_array_gardes = [269,203];
		_position_array_otages = [[4911.27,16129.4,0.412666],[4911.4,16128.1,0.384842]];
		_direction_array_otages = [100,52];
		LM_COMMANDER setVariable ['negades2_zone', 2, false];
	};
};

// Création des otages et gardes
_group_gardes = createGroup [east, true];
{
	_type = _type_array_gardes select _forEachIndex;
	_unit = _group_gardes createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit setDir (_direction_array_gardes select _forEachIndex);
	_unit disableAI "PATH";
	_mission_unit_array pushBack _unit;
} forEach _position_array_gardes;
_group_otages = createGroup [civilian, true];
_hostage_array = [];
{
	_type = selectRandom _type_array_otages;
	_unit = _group_otages createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit setDir (_direction_array_otages select _forEachIndex);
	_unit playMove (_type_array_anim select _forEachIndex);
	_unit disableAI "Anim";
	_hostage_array pushBack _unit;
} forEach _position_array_otages;

negades2_tasks_array = ["task_negades2_hostage_a", "task_negades2_hostage_b", "task_negades2_hostage_c", "task_negades2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["negades2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'negades2_trigger_indice') == (LM_COMMANDER getVariable 'negades2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'negades2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach negades2_tasks_array;
			LM_COMMANDER setVariable ['negades2_zone', nil];
		} else {
			_task = negades2_tasks_array select (thisTrigger getVariable 'negades2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['negades2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach negades2_liste_localisations;

//Garnison
_position_defend_array = [[5050.29,16241.8,0],[4771.35,16174.2,0],[4761.9,16176,0],[5033.4,16244,0]];
_direction_defend_array = [60,20,355,45];
for "_i" from 0 to ((count _position_defend_array)-1) do {
	_position = _position_defend_array select _i;
	_direction = _direction_defend_array select _i;
	_truck = ["KICC_TEMPEST_BACHE",_position,_direction,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _truck setVehicleLock "LOCKED"; _mission_object_array pushback _truck;
    _group = [_position, east, selectRandom[
		(configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "appui"),
		(configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")]] call BIS_fnc_spawnGroup; _group deleteGroupWhenEmpty true;
	_group setFormation "FILE";
	{_mission_unit_array pushback _x}forEach (units _group);
	sleep 1;
};

//Barrages
_type_array = ["KICC_FUSILIER","KICC_FUSILIER_AUTO","KICC_GRENADIER"];
_position_array = [[5049.32,16144.7,0],[5044.35,16152.5,0],[4747.04,16159.7,0],[4749.63,16151,0]];
for "_i" from 0 to ((count _position_array)-1) do {
	_group = createGroup EAST; _group deleteGroupWhenEmpty true;
	_type = _type_array call BIS_fnc_selectRandom;
	_position = _position_array select _i;
	_unit = _group createUnit [_type, _position, [], 0, "NONE"];
	_unit setPosATL _position;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit;
};

//Déclencheur otage
_trigger_hostage = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_hostage triggerAttachVehicle [(_hostage_array select 0)];
_trigger_hostage setTriggerArea [2, 3, 23, true];
_trigger_hostage setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['negades2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	sleep 5;
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["negades2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "negades2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_negades2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "negades2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_negades2";
LM_COMMANDER setVariable ['negades2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.