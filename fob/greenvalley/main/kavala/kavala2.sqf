// ------ Otages Kavala -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_kavala2 = createMarker ["marker_kavala2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Kavala" >> "position")]; "marker_kavala2" setMarkerType "Empty";
kavala2_liste_localisations = [[3535,12995],[3775,12990],[3650,13185],[3465,13260],[3545,12815],[3405,13105]];
[WEST,["task_kavala2_hostage_main"],["L'ennemi occupe encore l'ancienne capitale de l'île, <marker name='marker_kavala2'>Kavala</marker>. Mais la petite population locale qui a refusé l'évacuation n'apprécie pas la présence du KICC en ville, et de nombreuses initiatives, plus ou moins pacifiques, visant à gêner l'occupant sont apparues. Le commandement KICC a décidé de l'arrestation du maire de la ville et de l'ancien chef de la police municipale, espérant ainsi impressionner les riverains et faire taire la colère. Nous avons pu isoler six localisations potentielles où les otages pourraient être retenus, ils se trouvent forcément sur l'une d'elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Otages et répression", "marker_kavala2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_kavala2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_kavala2_hostage_a","task_kavala2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(kavala2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_kavala2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_kavala2_hostage_b","task_kavala2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(kavala2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_kavala2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_kavala2_hostage_c","task_kavala2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(kavala2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_kavala2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_kavala2_hostage_d","task_kavala2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(kavala2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_kavala2_hostage_d","meet"] call BIS_fnc_taskSetType;
[WEST,["task_kavala2_hostage_e","task_kavala2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle E", ""],(kavala2_liste_localisations select 4),false,1,false] call BIS_fnc_taskCreate;
["task_kavala2_hostage_e","meet"] call BIS_fnc_taskSetType;
[WEST,["task_kavala2_hostage_f","task_kavala2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle F", ""],(kavala2_liste_localisations select 5),false,1,false] call BIS_fnc_taskCreate;
["task_kavala2_hostage_f","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_kavala2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_kavala2";

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

// Ajustement de la configuration
_type_array_gardes = ["KICC_TL","KICC_FUSILIER"];
_type_array_otages = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
_type_array_anim = ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02","ApanPknlMstpSnonWnonDnon_G03"];
_position_array_gardes = [];
_direction_array_gardes = [];
_position_array_otages = [];
_direction_array_otages = [];
switch (floor(random 6)) do {
    case 0: {
		_position_array_gardes = [[3533.18,13000.1,12.058],[3530.5,12994.7,11.9924]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[3533.92,12996.6,12.102],[3532.24,12996.9,12.0297]];
		_direction_array_otages = [217,195];
		LM_COMMANDER setVariable ['kavala2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[3773.82,12992.5,0.149191],[3773.61,12983,0.138838]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[3773.6,12989,0.140568],[3773.49,12986.8,0.140123]];
		_direction_array_otages = [243,265];
		LM_COMMANDER setVariable ['kavala2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[3651.52,13184.8,3.48721],[3654.23,13190,3.54526]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[3650.38,13187.5,3.51556],[3650.47,13189.1,3.53857]];
		_direction_array_otages = [91,122];
		LM_COMMANDER setVariable ['kavala2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[3467.34,13257.6,4.14548],[3465.24,13251.5,4.09688]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[3466.07,13259.7,4.1629],[3467.21,13261,4.18315]];
		_direction_array_otages = [120,161];
		LM_COMMANDER setVariable ['kavala2_zone', 3, false];
	};
	case 4: {
		_position_array_gardes = [[3542.59,12812.9,4.17491],[3541.06,12808.3,4.29139]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[3544.09,12814.9,4.06609],[3542.36,12815.7,4.14826]];
		_direction_array_otages = [207,181];
		LM_COMMANDER setVariable ['kavala2_zone', 3, false];
	};
	case 5: {
		_position_array_gardes = [[3407.56,13104.3,3.54922],[3407.39,13111,3.773]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[3405.13,13106.5,3.63311],[3406.92,13107.5,3.65438]];
		_direction_array_otages = [129,159];
		LM_COMMANDER setVariable ['kavala2_zone', 3, false];
	};
};

// Création des otages et gardes
_group_gardes = createGroup [east, true];
{
	_type = _type_array_gardes select _forEachIndex;
	_unit = _group_gardes createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit setDir (_direction_array_gardes select _forEachIndex);
	_unit disableAI "PATH";
	_mission_unit_array pushBack _unit;
} forEach _position_array_gardes;
_group_otages = createGroup [civilian, true];
_hostage_array = [];
{
	_type = selectRandom _type_array_otages;
	_unit = _group_otages createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit setDir (_direction_array_otages select _forEachIndex);
	_unit playMove (_type_array_anim select _forEachIndex);
	_unit disableAI "Anim";
	_hostage_array pushBack _unit;
} forEach _position_array_otages;

kavala2_tasks_array = ["task_kavala2_hostage_a", "task_kavala2_hostage_b", "task_kavala2_hostage_c", "task_kavala2_hostage_d", "task_kavala2_hostage_e", "task_kavala2_hostage_f"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["kavala2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'kavala2_trigger_indice') == (LM_COMMANDER getVariable 'kavala2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'kavala2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach kavala2_tasks_array;
			LM_COMMANDER setVariable ['kavala2_zone', nil];
		} else {
			_task = kavala2_tasks_array select (thisTrigger getVariable 'kavala2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['kavala2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach kavala2_liste_localisations;

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

//Déclencheur otage
_trigger_hostage = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_hostage triggerAttachVehicle [(_hostage_array select 0)];
_trigger_hostage setTriggerArea [2, 3, 23, true];
_trigger_hostage setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['kavala2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["kavala2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "kavala2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_kavala2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "kavala2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_kavala2";
LM_COMMANDER setVariable ['kavala2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.