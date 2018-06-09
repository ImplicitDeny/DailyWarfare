// ------ Cache d'arme Kavala -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_kavala1 = createMarker ["marker_kavala1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Kavala" >> "position")]; "marker_kavala1" setMarkerType "Empty";
kavala1_box_position_array = [[3449.81,13028.9,0],[3361.13,13173.4,0],[3545.13,13264.9,0],[3729.05,13189.6,0],[3684.87,12982.9,0],[3588.3,12847.4,0]];
[WEST,["task_kavala1_cache_main"],["Le KICC a centralisé à <marker name='marker_kavala1'>Kavala</marker> plusieurs de ses points de ravitaillement. Un contact local nous a donné plusieurs positions potentielles pouvant accueillir des caches d'armes. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Ravitaillement détonnant", "marker_kavala1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_kavala1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_kavala1_cache_a","task_kavala1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(kavala1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_kavala1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_kavala1_cache_b","task_kavala1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(kavala1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_kavala1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_kavala1_cache_c","task_kavala1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(kavala1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_kavala1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_kavala1_cache_d","task_kavala1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(kavala1_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_kavala1_cache_d","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_kavala1_cache_e","task_kavala1_cache_main"],["Cache trouvée : N/A", "Cache potentielle E", ""],(kavala1_box_position_array select 4),false,1,false] call BIS_fnc_taskCreate;
["task_kavala1_cache_e","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_kavala1_cache_f","task_kavala1_cache_main"],["Cache trouvée : N/A", "Cache potentielle F", ""],(kavala1_box_position_array select 5),false,1,false] call BIS_fnc_taskCreate;
["task_kavala1_cache_f","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_kavala1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_kavala1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[3751.21,12729.6,0],95.931,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3750.68,12725.6,0],100.822,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3749.46,12722,0],107.469,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_BagBunker_Tower_F",[3747.76,12736,0],283.790,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage N
_object = ["Land_CncBarrier_F",[3666.57,13277,0],334.097,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3661.31,13280,0],80.785,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3660.54,13276.8,0],298.366,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3664.22,13274.7,0],120.609,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3547.12,13308.6,0.220453],223.95,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3543.83,13311.9,0.292306],227.349,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3488.74,13365.8,0.246989],214.177,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3484.93,13368.5,0.277298],217.576,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3796.8,13139.5,0.192086],223.95,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3793.51,13142.8,0.234886],227.349,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[3657.06,13278.6,0],33.400,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[3667.47,13272.5,0],33.400,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage S
_object = ["Land_CncBarrier_F",[3399.54,12624.7,0],157.869,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3404.6,12621.3,0],264.558,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3405.56,12624.4,0],122.138,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[3402.03,12626.7,0],304.381,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[3408.92,12622.4,0],217.172,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[3398.94,12629.2,0],217.172,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
kavala1_tasks_array = ["task_kavala1_cache_a", "task_kavala1_cache_b", "task_kavala1_cache_c", "task_kavala1_cache_d", "task_kavala1_cache_e", "task_kavala1_cache_f"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["kavala1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "kavala1_cache_indice";
				_task = (kavala1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["kavala1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'kavala1_cache_indice';
				_task = (kavala1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach kavala1_box_position_array;
};



//Garnison
_position_defend_array = [[3183.41,12900.2,0],[3197.49,12895.7,0],[3733.85,12995,0],[3745.57,13035.3,0],[3508.89,13012.9,0],[3506.29,13002.7,0],[3619.39,13362.1,0],[3626.81,13354.9,0]];
_direction_defend_array = [210,185,120,90,290,285,25,55];
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
_position_array = [[3748.06,12723.9,0],[3749.99,12735.2,2.6692],[3751.14,12741.1,0],[3749.22,12729.3,0],[3667.29,13275.4,0.131678],[3659.42,13279.5,0.0820065],[3545.8,13307.7,0.106449],[3542.7,13310.6,0.155327],[3487.47,13364.3,0.0815775],[3484.01,13367,0.0653503],[3406.37,12621.6,0],[3399.45,12626.5,0]];
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
	} forEach kavala1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_kavala1";
["task_kavala1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.