// ------ Cache d'arme Pyrgos -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_pyrgos1 = createMarker ["marker_pyrgos1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Pyrgos" >> "position")]; "marker_pyrgos1" setMarkerType "Empty";
dummy_arti_center = "Land_HelipadEmpty_F" createVehicleLocal getMarkerPos "marker_pyrgos1";
pyrgos1_box_position_array = [[16825.6,12640.6,0],[16770.5,12778.2,0],[16719.1,12537.8,0],[16939.9,12726,0.292522]];
[WEST,["task_pyrgos1_cache_main"],["La capitale d'Altis, <marker name='marker_pyrgos1'>Pyrgos</marker>, est sujette à de rudes combats depuis plusieurs jours. Les affrontements y sont réguliers, sans qu'aucun des deux camps ne parvienne à assoir véritablement sa domination. Profitant d'une accalmie, le KICC semble déterminé à déployer des points de ravitaillement au plus proche de ses troupes. Rendez-vous aux points indiqués sur carte et voyez s'ils ont réussi à déployer du ravitaillement. Si c'est le cas, débarassez-vous en.", "Soutien aux troupes", "marker_pyrgos1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_pyrgos1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos1_cache_a","task_pyrgos1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(pyrgos1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos1_cache_b","task_pyrgos1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(pyrgos1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos1_cache_c","task_pyrgos1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(pyrgos1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos1_cache_d","task_pyrgos1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(pyrgos1_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_pyrgos1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_pyrgos1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[17018.3,12668.7,0],185.825,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[17021.2,12667.7,0],212.739,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[17018.8,12673.4,0],185.476,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[17021.9,12673.8,0],158.199,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[17018.9,12676.9,0],95.377,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[17018.3,12665.5,0],91.366,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage N
_object = ["Land_CncBarrier_F",[17048.9,12890.7,0],130.032,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[17051.3,12892.6,0],156.946,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[17044.1,12892.2,0],135.207,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[17045.8,12894.9,0],107.930,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[17051.6,12889,0],24.438,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[17041.3,12894.1,0],28.449,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage S
_object = ["Land_CncBarrier_F",[16814.1,12010.9,0],135.207,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16814,12014.5,0],55.719,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16820.7,12013.9,0],318.303,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16820.5,12010.3,0],238.816,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16821.6,12073.2,0],321.978,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16821.2,12069.6,0],242.490,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16814.7,12071,0],145.075,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[16815.3,12074.6,0],65.587,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
pyrgos1_tasks_array = ["task_pyrgos1_cache_a", "task_pyrgos1_cache_b", "task_pyrgos1_cache_c", "task_pyrgos1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["pyrgos1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "pyrgos1_cache_indice";
				_task = (pyrgos1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["pyrgos1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'pyrgos1_cache_indice';
				_task = (pyrgos1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach pyrgos1_box_position_array;
};


//Garnison
_position_defend_array = [[16804.4,12024.6,0],[16802.9,12052.2,0],[16590.5,12716.8,0],[16578.8,12735.2,0],[17000.4,12878,0],[16984.9,12856.6,0]];
_direction_defend_array = [240,285,205,285,0,240];
for "_i" from 0 to ((count _position_defend_array)-1) do {
	_position = _position_defend_array select _i;
	_direction = _direction_defend_array select _i;
	_truck = ["KICC_TEMPEST_BACHE",_position,_direction,"SURFACE_NORMAL",true] call LM_fnc_objectCreation; _truck setVehicleLock "LOCKED"; _mission_object_array pushback _truck;
    _group = [_position, east, selectRandom[
		(configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "appui"),
		(configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")]] call BIS_fnc_spawnGroup; _group deleteGroupWhenEmpty true;
	_group deleteGroupWhenEmpty true;
	_group setFormation "FILE";
	{_mission_unit_array pushback _x}forEach (units _group);
	sleep 1;
};

//Barrages
_type_array = ["KICC_FUSILIER","KICC_FUSILIER_AUTO","KICC_GRENADIER"];
_position_array = [[17020,12666.8,0],[17020.8,12674.9,0],[17044.4,12895.4,0],[17051.6,12891.4,0],[16813.4,12012.4,0],[16821.2,12012.1,0],[16822.1,12071.7,0],[16814.3,12072.8,0]];
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
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach pyrgos1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_pyrgos1";
["task_pyrgos1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.