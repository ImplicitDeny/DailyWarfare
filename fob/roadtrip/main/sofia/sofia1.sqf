// ------ Cache d'arme Sofia -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_sofia1 = createMarker ["marker_sofia1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Sofia" >> "position")]; "marker_sofia1" setMarkerType "Empty";
sofia1_box_position_array = [[25790.4,21341.4,0],[25506,21387.4,0],[25678.8,21416.4,0],[25672.2,21273.3,0]];
[WEST,["task_sofia1_cache_main"],["Le KICC rassemble du matériel à <marker name='marker_sofia1'>Sofia</marker>. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Stockage à Sofia", "marker_sofia1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_sofia1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_sofia1_cache_a","task_sofia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(sofia1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_sofia1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_sofia1_cache_b","task_sofia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(sofia1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_sofia1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_sofia1_cache_c","task_sofia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(sofia1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_sofia1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_sofia1_cache_d","task_sofia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(sofia1_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_sofia1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_sofia1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_sofia1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[25793.1,21441.4,0],126.754,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25795.8,21443.7,0],333.596,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25792.6,21447.2,0],298.220,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25790.1,21444.7,0],145.062,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25789.3,21447.9,0],43.830,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25796.4,21440.4,0],46.230,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage W
_object = ["Land_CncBarrier_F",[25530.8,21194.1,0],133.817,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25533.7,21196.1,0],340.659,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25530.9,21199.9,0],305.283,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25528.2,21197.7,0],152.125,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25527.7,21201,0],50.893,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25533.9,21192.8,0],53.293,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
sofia1_tasks_array = ["task_sofia1_cache_a", "task_sofia1_cache_b", "task_sofia1_cache_c", "task_sofia1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["sofia1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "sofia1_cache_indice";
				_task = (sofia1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["sofia1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'sofia1_cache_indice';
				_task = (sofia1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach sofia1_box_position_array;
};


//Garnison
_position_defend_array = [[25822.9,21441.1,0],[25830.3,21447.4,0],[25719.6,21269.4,0],[25709,21279.1,0],[25551.3,21452.3,0],[25557,21446.8,0]];
_direction_defend_array = [140,135,50,40,225,220];
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
_position_array = [[25791.7,21448.9,0],[25798.1,21442.3,0],[25526.5,21198.6,0],[25531.1,21192.1,0]];
for "_i" from 0 to ((count _position_array)-1) do {
	_group = createGroup EAST; _group deleteGroupWhenEmpty true;
	_type = _type_array call BIS_fnc_selectRandom;
	_position = _position_array select _i;
	_unit = _group createUnit [_type, _position, [], 0, "NONE"];
	_unit setPosATL _position;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit;
};

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach sofia1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_sofia1";
["task_sofia1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.