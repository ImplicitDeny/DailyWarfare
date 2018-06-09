// ------ Otages Panochori -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_panochori2 = createMarker ["marker_panochori2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Panochori" >> "position")]; "marker_panochori2" setMarkerType "Empty";
panochori2_liste_localisations = [[4995,11065],[5175,11205],[4985,11425],[5030,11265]];
[WEST,["task_panochori2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_panochori2'>Panochori</marker>, espérant s'en servir comme monnaie d'échange contre certains de leurs officiers que nous avons capturé. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Monnaie d'échange", "marker_panochori2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_panochori2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_panochori2_hostage_a","task_panochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(panochori2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_panochori2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_panochori2_hostage_b","task_panochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(panochori2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_panochori2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_panochori2_hostage_c","task_panochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(panochori2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_panochori2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_panochori2_hostage_d","task_panochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(panochori2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_panochori2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_panochori2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_panochori2";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage W
_object = ["Land_CncBarrier_F",[4954.37,11420.4,0],53,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[4953.11,11423.2,0],80,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[4950.75,11417.7,0],55,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[4948.42,11419.6,0],23,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[4957.12,11422.1,0],322,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[4949.33,11414.1,0],118,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage E
_object = ["Land_CncBarrier_F",[5207.35,11117.8,0],216,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[5209.35,11115.5,0],244,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[5210.14,11121.2,0],219,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[5212.91,11120.1,0],187,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[5204.44,11116,0],312,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[5211.64,11124.2,0],305,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

// Ajustement de la configuration
_type_array_gardes = ["KICC_TL","KICC_FUSILIER"];
_type_array_otages = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
_type_array_anim = ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02","ApanPknlMstpSnonWnonDnon_G03"];
_position_array_gardes = [];
_direction_array_gardes = [];
_position_array_otages = [];
_direction_array_otages = [];
switch (floor(random 4)) do {
    case 0: {
		_position_array_gardes = [[5002.47,11052.2,0.194893],[4991.99,11063.2,0.110638]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[4997.09,11063.4,0.134064],[4999.19,11061.7,0.158733]];
		_direction_array_otages = [176,208];
		LM_COMMANDER setVariable ['panochori2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[5172.56,11201.9,4.035],[5170.61,11197,4.43786]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[5173.78,11203.9,3.72805],[5171.93,11204.3,3.86825]];
		_direction_array_otages = [229,207];
		LM_COMMANDER setVariable ['panochori2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[4984.01,11425.1,0.540825],[4987.77,11422.8,0.791798]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[4987.05,11426.3,0.540287],[4988.5,11425,0.69556]];
		_direction_array_otages = [208,223];
		LM_COMMANDER setVariable ['panochori2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[5026.7,11259.5,4.219],[5022.12,11261.5,4.3737]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[5028.34,11262.7,3.67858],[5026.09,11263.1,3.74448]];
		_direction_array_otages = [205,167];
		LM_COMMANDER setVariable ['panochori2_zone', 3, false];
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

panochori2_tasks_array = ["task_panochori2_hostage_a", "task_panochori2_hostage_b", "task_panochori2_hostage_c", "task_panochori2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["panochori2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'panochori2_trigger_indice') == (LM_COMMANDER getVariable 'panochori2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'panochori2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach panochori2_tasks_array;
			LM_COMMANDER setVariable ['panochori2_zone', nil];
		} else {
			_task = panochori2_tasks_array select (thisTrigger getVariable 'panochori2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['panochori2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach panochori2_liste_localisations;

//Garnison
_position_defend_array = [[5125.67,11410.2,0],[5125.27,11417.5,0],[5127.18,11023.3,0],[5124.23,11029.8,0],[4953.12,11172.6,0],[4945.14,11167.2,0]];
_direction_defend_array = [90,100,95,75,330,320];
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
_position_array = [[5212.47,11121.5,0],[5207.35,11115.7,0],[4954.3,11422.5,0],[4948.54,11418.1,0]];
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
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['panochori2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["panochori2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "panochori2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_panochori2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "panochori2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_panochori2";
LM_COMMANDER setVariable ['panochori2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.