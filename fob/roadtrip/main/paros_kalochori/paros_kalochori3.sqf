// ------ Cache d'arme Paros -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_paros_kalochori3 = createMarker ["marker_paros_kalochori3", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Paros" >> "position")]; "marker_paros_kalochori3" setMarkerType "Empty";
paros_kalochori3_box_position_array = [[20873,17017.2,0],[20971.8,17059.5,0],[20975.6,16858.9,0],[21027.9,16978.3,0]];
[WEST,["task_paros_kalochori3_cache_main"],["Le KICC a fait de <marker name='marker_paros_kalochori3'>Paros</marker> un de ses points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_paros_kalochori3"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_paros_kalochori3_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori3_cache_a","task_paros_kalochori3_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],(paros_kalochori3_box_position_array select 0),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori3_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori3_cache_b","task_paros_kalochori3_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],(paros_kalochori3_box_position_array select 1),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori3_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori3_cache_c","task_paros_kalochori3_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],(paros_kalochori3_box_position_array select 2),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori3_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori3_cache_d","task_paros_kalochori3_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],(paros_kalochori3_box_position_array select 3),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori3_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_paros_kalochori3_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_paros_kalochori3";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[21059.1,17057.3,0],319.079,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21056.4,17055.8,0],345.993,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21058.8,17051.2,0],141.791,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21061.6,17052.5,0],168.704,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[21056.1,17059.5,0],236.215,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[21061.7,17049,0],250.235,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage S
_object = ["Land_CncBarrier_F",[21027.6,16891.4,0],40.358,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21025.8,16894.2,0],67.272,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21021.8,16891.2,0],223.069,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[21023.7,16888.7,0],61.674,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[21030,16894.8,0],327.150,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[21020.2,16888.2,0],333.550,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage W
_object = ["Land_CncBarrier_F",[20869.9,16795.8,0],298.952,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20867.9,16793.5,0],325.865,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20871.8,16790,0],121.663,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20873.9,16792.2,0],148.576,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20866.3,16796.8,0],216.087,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20875.3,16788.7,0],230.107,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
paros_kalochori3_tasks_array = ["task_paros_kalochori3_cache_a", "task_paros_kalochori3_cache_b", "task_paros_kalochori3_cache_c", "task_paros_kalochori3_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["paros_kalochori3_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "paros_kalochori3_cache_indice";
				_task = (paros_kalochori3_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["paros_kalochori3_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'paros_kalochori3_cache_indice';
				_task = (paros_kalochori3_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach paros_kalochori3_box_position_array;
};


//Garnison
_position_defend_array = [[21063.8,16902.7,0],[21070.7,16907.1,0],[20799.1,16986.8,0],[20801.9,16976.1,0]];
_direction_defend_array = [140,140,300,265];
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
_position_array = [[21063.2,17051.5,0],[21058.8,17059.2,0],[21022.6,16887.3,0],[21030,16892.3,0],[20865.5,16793.9,0],[20872.5,16788,0]];
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
	} forEach paros_kalochori3_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_paros_kalochori3";
["task_paros_kalochori3_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.