// ------ Cache d'arme Kalochori -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_paros_kalochori1 = createMarker ["marker_paros_kalochori1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Kalochori" >> "position")]; "marker_paros_kalochori1" setMarkerType "Empty";
paros_kalochori1_box_position_array = [[21296.8,16293.5,0],[21459.7,16418.4,0],[21338.5,16421,0],[21402.3,16296.3,0]];
[WEST,["task_paros_kalochori1_cache_main"],["Le KICC a fait de <marker name='marker_paros_kalochori1'>Kalochori</marker> un de ses points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_paros_kalochori1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_paros_kalochori1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori1_cache_a","task_paros_kalochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(paros_kalochori1_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori1_cache_b","task_paros_kalochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(paros_kalochori1_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori1_cache_c","task_paros_kalochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(paros_kalochori1_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori1_cache_d","task_paros_kalochori1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(paros_kalochori1_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_paros_kalochori1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_paros_kalochori1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[21457.3,16365.3,0],73.301,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21460.9,16369.5,0],179.150,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21458,16370.7,0],37.230,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21455.6,16367.7,0],219.813,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[21453.6,16365.2,0],125.397,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[21459.2,16372.5,0],129.017,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage N
_object = ["Land_CncBarrier_F",[21357.6,16477.6,0],274.078,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21352.6,16474.9,0],20.427,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21355,16472.7,0],238.008,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21358.3,16474.7,0],60.590,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[21361,16476.3,0],326.174,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[21353.2,16471.5,0],329.794,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage S
_object = ["Land_CncBarrier_F",[21345.9,16251.1,0],330.799,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21349,16253.4,0],133.159,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_BagBunker_Tower_F",[21349.7,16260.5,0],311.241,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage W
_object = ["Land_CncBarrier_F",[21189.1,16313.4,0],136.705,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21191.7,16315,0],163.616,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21190.6,16318.6,0],342.940,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21187.6,16318.4,0],9.854,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[21189.8,16321.9,0],250.430,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[21191.9,16312.7,0.146149],279.143,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
paros_kalochori1_tasks_array = ["task_paros_kalochori1_cache_a", "task_paros_kalochori1_cache_b", "task_paros_kalochori1_cache_c", "task_paros_kalochori1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["paros_kalochori1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "paros_kalochori1_cache_indice";
				_task = (paros_kalochori1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["paros_kalochori1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'paros_kalochori1_cache_indice';
				_task = (paros_kalochori1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach paros_kalochori1_box_position_array;
};


//Garnison
_position_defend_array = [[21251.1,16177.4,0],[21252.9,16188.9,0],[21426,16443.1,0],[21432.8,16447.4,0],[21466.9,16224.9,0],[21454.4,16228,0]];
_direction_defend_array = [285,290,140,140,25,350];
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
_position_array = [[21461,16371.1,0],[21455.8,16364.8,0],[21359.5,16478.4,0],[21352,16473.8,0],[21346.3,16253.5,0],[21355.3,16261.9,0],[21351,16259.3,2.80476],[21187.9,16320.1,0],[21189.9,16312.3,0]];
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
	} forEach paros_kalochori1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_paros_kalochori1";
["task_paros_kalochori1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.