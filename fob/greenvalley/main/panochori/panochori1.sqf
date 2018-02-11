// ------ Cache d'arme Panochori -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_panochori1 = createMarker ["marker_panochori1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Panochori" >> "position")]; "marker_panochori1" setMarkerType "Empty";
panochori1_box_position_array = [[5163.06,11101.7,0],[5142.38,11240.5,0],[5031.79,11366.8,0],[5050.06,11215.3,0.661182]];
[WEST,["task_panochori1_cache_main"],["Le KICC a fait de <marker name='marker_panochori1'>Panochori</marker> un de ses points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_panochori1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_panochori1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_panochori1_cache_a","task_panochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(panochori1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_panochori1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_panochori1_cache_b","task_panochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(panochori1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_panochori1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_panochori1_cache_c","task_panochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(panochori1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_panochori1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_panochori1_cache_d","task_panochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(panochori1_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_panochori1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_panochori1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_panochori1";

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

//Objectifs
panochori1_tasks_array = ["task_panochori1_cache_a", "task_panochori1_cache_b", "task_panochori1_cache_c", "task_panochori1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["panochori1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "panochori1_cache_indice";
				_task = (panochori1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["panochori1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'panochori1_cache_indice';
				_task = (panochori1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach panochori1_box_position_array;
};


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

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach panochori1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_panochori1";
["task_panochori1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.