// ------ Cache d'arme Zaros -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_zaros1 = createMarker ["marker_zaros1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Zaros" >> "position")]; "marker_zaros1" setMarkerType "Empty";
zaros1_box_position_array = [[9121.87,11912.9,0],[9015.88,11996.5,0],[9059.39,12067.1,0],[8955.96,12073.9,0]];
[WEST,["task_zaros1_cache_main"],["Le KICC a fait de <marker name='marker_zaros1'>Zaros</marker> un de ses points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_zaros1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_zaros1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_zaros1_cache_a","task_zaros1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(zaros1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_zaros1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_zaros1_cache_b","task_zaros1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(zaros1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_zaros1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_zaros1_cache_c","task_zaros1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(zaros1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_zaros1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_zaros1_cache_d","task_zaros1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(zaros1_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_zaros1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_zaros1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_zaros1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage A
_object = ["Land_CncBarrier_F",[9033.38,11781.6,0],298.952,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9031.36,11779.3,0],325.865,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9037.15,11779.1,0],304.126,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9035.95,11776.2,0],276.849,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9040.51,11780.2,0],201.211,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9031.86,11785.3,0],216.087,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage B
_object = ["Land_CncBarrier_F",[9322.98,11888.7,0],221.387,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9321.72,11894.4,0],199.649,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9324.87,11893.9,0],172.371,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9320.26,11890.1,0],194.474,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9319.85,11897.3,0],96.733,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9316.98,11887.5,0],111.609,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage C
_object = ["Land_CncBarrier_F",[8939.87,11994.4,0],43.483,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8940.92,11988.7,0],21.745,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8937.79,11989.3,0],354.467,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8942.54,11993,0],16.570,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[8945.84,11995.2,0],293.705,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[8942.59,11984.6,0],281.571,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage D
_object = ["Land_CncBarrier_F",[8908.48,12122.5,0],13.721,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8912.22,12118.1,0],351.983,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8909.24,12117,0],324.705,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8911.53,12122.6,0],346.808,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[8912.55,12125,0],262.315,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[8914.9,12116.4,0],262.315,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage E
_object = ["Land_CncBarrier_F",[9160.85,12099.2,0],179.335,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9156.14,12102.6,0],157.397,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9158.75,12104.4,0],130.319,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9157.91,12098.4,0],152.422,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9152.75,12103.5,0],54.681,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9156.77,12095.4,0],68.235,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
zaros1_tasks_array = ["task_zaros1_cache_a", "task_zaros1_cache_b", "task_zaros1_cache_c", "task_zaros1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["zaros1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "zaros1_cache_indice";
				_task = (zaros1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["zaros1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'zaros1_cache_indice';
				_task = (zaros1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach zaros1_box_position_array;
};


//Garnison
_position_defend_array = [[9235.33,11976.2,0],[9242.56,11974.3,0],[8862.82,12162.3,0],[8861.52,12169.6,0],[9022.64,11737.1,0],[9017.48,11731.8,0]];
_direction_defend_array = [15,10,260,255,135,130];
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
_position_array = [[9031.12,11781.5,0],[9038.28,11777.3,0],[9321.26,11888,0],[9323.59,11895.5,0],[8938.03,11986.2,0],[8941.83,11995.5,0],[8911.79,12115.5,0],[8909.65,12124.1,0],[9159.7,12096.1,0],[9155.77,12105.4,0]];
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
	} forEach zaros1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
["task_zaros1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_zaros1";
// ... end of mission's code, do not edit any of the lines bellow.