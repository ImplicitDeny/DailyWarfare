// ------ Cache d'arme Negades -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_negades1 = createMarker ["marker_negades1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Negades" >> "position")]; "marker_negades1" setMarkerType "Empty";
negades1_box_position_array = [[4940.75,16101.6,0],[4921.75,16200,0],[4793.4,16217.1,0]];
[WEST,["task_negades1_cache_main"],["Le KICC tente de raffermir son emprise sur Kavala en installant des troupes au nord de la ville. Ainsi, <marker name='marker_negades1'>Negades</marker> est devenu un de leurs points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_negades1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_negades1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_negades1_cache_a","task_negades1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(negades1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_negades1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_negades1_cache_b","task_negades1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(negades1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_negades1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_negades1_cache_c","task_negades1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(negades1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_negades1_cache_c","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_negades1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_negades1";

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

//Objectifs
negades1_box_position_array = [[4940.75,16101.6,0],[4921.75,16200,0],[4793.4,16217.1,0]];
negades1_tasks_array = ["task_negades1_cache_a", "task_negades1_cache_b", "task_negades1_cache_c"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["negades1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "negades1_cache_indice";
				_task = (negades1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["negades1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'negades1_cache_indice';
				_task = (negades1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach negades1_box_position_array;
};


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

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach negades1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_negades1";
["task_negades1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.