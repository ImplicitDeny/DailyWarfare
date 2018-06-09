// ------ Cache d'arme Chalkeia -----
// Author : [LM]Stark
// Date   : 22/02/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_chalkeia1 = createMarker ["marker_chalkeia1", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Chalkeia" >> "position")]; "marker_chalkeia1" setMarkerType "Empty";
[WEST,["task_chalkeia1_cache_main"],["Le KICC a fait de <marker name='marker_chalkeia1'>Chalkeia</marker> un de ses points de ravitaillement. L'ennemi a disposé des caisses de munitions à divers endroits de la ville. Vérifiez chacune de ces localisations et détruisez les caches d'armes lorsque vous en trouvez une.", "Caches d'armes", "marker_chalkeia1"],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_chalkeia1_cache_main","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia1_cache_a","task_chalkeia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle A", ""],[20202.9,11711.2,0],false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia1_cache_a","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia1_cache_b","task_chalkeia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle B", ""],[20269.3,11565.8,0],false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia1_cache_b","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia1_cache_c","task_chalkeia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle C", ""],[20131.5,11673.9,0.423],false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia1_cache_c","destroy"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia1_cache_d","task_chalkeia1_cache_main"],["Cache trouvée : N/A", "Cache potentielle D", ""],[20278,11674.4,0],false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia1_cache_d","destroy"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_chalkeia1_cache_main";
LM_MISSION_POSITION = getMarkerPos "marker_chalkeia1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage W
_object = ["Land_CncBarrier_F",[20081.2,11689.9,0],342.069,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20078.1,11689.6,0],8.983,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20082.6,11685,0],341.04,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20079.8,11683.4,0],313.762,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20081.8,11693.6,0],263.501,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20083.7,11681.9,0],247.271,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage N
_object = ["Land_CncBarrier_F",[20352.7,11846.3,0],118.463,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20354.7,11848.6,0],145.377,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20347.7,11848.4,0],117.434,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20348.6,11851.4,0],90.157,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20355.9,11845.1,0],23.683,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20339.1,11851.2,0],8.373,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20344.8,11849.7,0],19.186,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage S
_object = ["Land_CncBarrier_F",[20265.5,11394.7,0],227.736,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20267,11392,0],254.65,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20269,11398.7,0],226.707,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[20271.6,11396.8,0],199.43,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20263.1,11392.7,0],129.476,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20271.2,11401,0],128.458,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20258.9,11388.8,0],325.425,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[20253.9,11386.3,0],338.675,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Objectifs
chalkeia1_box_position_array = [[20202.9,11711.2,0],[20269.3,11565.8,0],[20131.5,11673.9,0.423],[20278,11674.4,0]];
chalkeia1_tasks_array = ["task_chalkeia1_cache_a", "task_chalkeia1_cache_b", "task_chalkeia1_cache_c", "task_chalkeia1_cache_d"];
_box_array = [];
while {count _box_array == 0} do
{
	{
		if((random 2) > 1) then {
			_box_array pushBack (["Box_IND_AmmoVeh_F",_x,0,"SURFACE_NORMAL",true] call LM_fnc_objectCreation);
			(_box_array select (count _box_array - 1)) setVariable ["chalkeia1_cache_indice", _forEachIndex, false];
			(_box_array select (count _box_array - 1)) addEventHandler ["killed",
			{
				_index = (_this select 0) getVariable "chalkeia1_cache_indice";
				_task = (chalkeia1_tasks_array select _index);
				[_task, "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
				_current = [_task] call BIS_fnc_taskDescription;
				[_task, ["Cache trouvée : OUI", (_current select 1), ""]] spawn BIS_fnc_taskSetDescription;
			}];
		} else {
			_trigger = createTrigger ["EmptyDetector", _x, false];
			_trigger setVariable ["chalkeia1_cache_indice", _forEachIndex, false];
			_trigger setTriggerArea [8, 8, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", true];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'chalkeia1_cache_indice';
				_task = (chalkeia1_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Cache trouvée : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach chalkeia1_box_position_array;
};


//Garnison
_position_defend_array = [[20443.3,11453,0],[20424.5,11465.3,0],[20001.2,11641.6,0],[20004.3,11621.7,0],[20442.8,11751.7,0],[20437.1,11758.7,0]];
_direction_defend_array = [5,185,300,200,235,225];
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
_position_array = [[20201.2,11713.4,0],[20203.6,11708.1,0],[20267.9,11568.7,0],[20270.8,11562.8,0],[20135.1,11675.1,0],[20132.3,11670.9,0],[20279.3,11676.8,0],[20274.2,11673.4,0]];
for "_i" from 0 to ((count _position_array)-1) do {
	_group = createGroup EAST; _group deleteGroupWhenEmpty true;
	_type = _type_array call BIS_fnc_selectRandom;
	_position = _position_array select _i;
	_unit = _group createUnit [_type, _position, [], 0, "NONE"];
	_unit setPosATL _position;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit;
};

//Support Jet
_trigger_jet_support = createTrigger ["EmptyDetector", getMarkerPos "marker_chalkeia", true];
_trigger_jet_support setTriggerArea [1000, 1000, 0, false];
_trigger_jet_support setTriggerActivation ["EAST", "WEST D", false];
_trigger_jet_support setTriggerStatements ["this", "[[0,0,250], getMarkerPos 'marker_chalkeia'] call LM_fnc_kiccJetSupport; deleteVehicle thisTrigger;", ""];

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach chalkeia1_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_chalkeia1";
["task_chalkeia1_cache_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.