// ------ Cache d'arme Agios Dionysios -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_agios_dionysios1 = createMarker ["marker_agios_dionysios1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "AgiosDionysios" >> "position")]; "marker_agios_dionysios1" setMarkerType "Empty";
[WEST,["task_agios_dionysios1_cache_main"],["Le KICC a fait de <marker name='marker_agios_dionysios1'>Agios Dionysios</marker> un de ses points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_agios_dionysios1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_agios_dionysios1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios1_cache_a","task_agios_dionysios1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],[9291.13,15804.5,0],false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios1_cache_b","task_agios_dionysios1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],[9201.05,15843,0],false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios1_cache_c","task_agios_dionysios1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],[9323.71,15897,0],false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios1_cache_d","task_agios_dionysios1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],[9476.18,15974,0],false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_agios_dionysios1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_agios_dionysios1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[9711.67,15923.9,0],146.268,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9714.25,15928.8,0],146.268,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9713.5,15919.1,0],146.268,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9715.27,15925.1,0],176.372,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9710.67,15927.8,0],176.372,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9711.99,15922.9,0],176.372,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9716.74,15920.3,0],176.372,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9715.52,15924.1,0],146.268,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9712.03,15929.9,0],75,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9716.05,15917.1,0],71.749,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9717.88,15911.8,0],68.928,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9720.53,15906.7,0],56.849,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9722.42,15901.2,0],84.602,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_1_F",[9713.62,15924,0],72.311,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage W
_object = ["Land_CncBarrier_F",[8976.04,15748.5,0],199.124,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8976.79,15754.1,0],206.369,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8979.42,15749.3,0],199.124,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8978.2,15743.7,0],209.115,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8975.87,15749.7,0],357.720,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8979.33,15748.2,0],350.810,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8974.89,15744.4,0],357.720,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8980.1,15753.4,0],357.720,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[8978.76,15755.4,0],284.366,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[8976.17,15742.5,0],284.366,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_1_F",[8977.61,15748.9,0],275.617,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage N
_object = ["Land_CncBarrier_F",[9053.67,16111.4,0],41.093,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9059.37,16110.9,0],41.093,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9058.03,16113.3,0],258.081,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9055.08,16109.1,0],258.081,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9060.17,16113,0],330.635,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9052.03,16108.6,0],324.936,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage S
_object = ["Land_CncBarrier_F",[9135.33,15269,0],228.143,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9129.63,15270.3,0],37.633,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9130.08,15268,0],119.029,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9135.13,15271.4,0],124.796,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9127.96,15268.5,0],166.062,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9124.58,15266.5,0],135.126,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9138.04,15270.5,0],0,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
agios_dionysios1_box_position_array = [[9291.13,15804.5,0],[9201.05,15843,0],[9323.71,15897,0],[9476.18,15974,0]];
agios_dionysios1_tasks_array = ["task_agios_dionysios1_cache_a", "task_agios_dionysios1_cache_b", "task_agios_dionysios1_cache_c", "task_agios_dionysios1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["agios_dionysios1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "agios_dionysios1_cache_indice";
				_task = (agios_dionysios1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["agios_dionysios1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'agios_dionysios1_cache_indice';
				_task = (agios_dionysios1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach agios_dionysios1_box_position_array;
};



//Garnison
_position_defend_array = [[9231.25,15968.2,0],[9232.56,15959.5,0],[9728.7,15886.5,0],[9720,15876.7,0],[9126.18,15767.7,0],[9113.08,15762.2,0]];
_direction_defend_array = [55,65,95,120,180,170];
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
_position_array = [[9717.69,15919.3,0],[9714.08,15930.4,0],[9058.86,16115,0],[9051.86,16111.2,0],[8976.6,15755.4,0],[8974.41,15743.3,0],[9137.17,15268.6,0],[9128.09,15266.2,0]];
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
	} forEach agios_dionysios1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_agios_dionysios1";
["task_agios_dionysios1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.