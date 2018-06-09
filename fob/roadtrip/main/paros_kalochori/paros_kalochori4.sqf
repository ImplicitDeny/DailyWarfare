// ------ Otages Paros -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_paros_kalochori4 = createMarker ["marker_paros_kalochori4", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Paros" >> "position")]; "marker_paros_kalochori4" setMarkerType "Empty";
paros_kalochori4_liste_localisations = [[20900,16895],[20890,17080],[21070,17005],[20995,16815]];
[WEST,["task_paros_kalochori4_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_paros_kalochori4'>Paros</marker>, afin de nous empêcher d'effectuer des frappes aériennes dans la zone. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Bouclier humain", "marker_paros_kalochori4"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_paros_kalochori4_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori4_hostage_a","task_paros_kalochori4_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(paros_kalochori4_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori4_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori4_hostage_b","task_paros_kalochori4_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(paros_kalochori4_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori4_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori4_hostage_c","task_paros_kalochori4_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(paros_kalochori4_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori4_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori4_hostage_d","task_paros_kalochori4_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(paros_kalochori4_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori4_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_paros_kalochori4_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_paros_kalochori4";

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

// Ajustement de la configuration
_type_array_gardes = ["KICC_TL","KICC_FUSILIER"];
_type_array_otages = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F"];
_type_array_anim = ["ApanPknlMstpSnonWnonDnon_G01","ApanPknlMstpSnonWnonDnon_G02","ApanPknlMstpSnonWnonDnon_G03"];
_position_array_gardes = [];
_direction_array_gardes = [];
_position_array_otages = [];
_direction_array_otages = [];
switch (floor(random 4)) do {
    case 0: {
		_position_array_gardes = [[20895.8,16892.7,1.66716],[20887.9,16894.5,0.945816]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20900.6,16895.5,2.40672],[20900.7,16893.4,2.45124]];
		_direction_array_otages = [251,289];
		LM_COMMANDER setVariable ['paros_kalochori4_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[20892.4,17078.1,4.66821],[20896.7,17082.3,4.69572]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20892.1,17081,4.61992],[20894,17080.3,4.70722]];
		_direction_array_otages = [179,233];
		LM_COMMANDER setVariable ['paros_kalochori4_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[21071.8,17003.2,3.86288],[21070.9,16999.2,3.88645]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[21070.8,17005.6,3.75443],[21072.2,17005.3,3.84304]];
		_direction_array_otages = [165,207];
		LM_COMMANDER setVariable ['paros_kalochori4_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[20996.2,16813.5,0.731873],[20998.9,16820,0.631531]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20994.8,16815.7,0.520863],[20995.9,16816.6,0.554237]];
		_direction_array_otages = [122,142];
		LM_COMMANDER setVariable ['paros_kalochori4_zone', 3, false];
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

paros_kalochori4_tasks_array = ["task_paros_kalochori4_hostage_a", "task_paros_kalochori4_hostage_b", "task_paros_kalochori4_hostage_c", "task_paros_kalochori4_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["paros_kalochori4_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'paros_kalochori4_trigger_indice') == (LM_COMMANDER getVariable 'paros_kalochori4_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'paros_kalochori4_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach paros_kalochori4_tasks_array;
			LM_COMMANDER setVariable ['paros_kalochori4_zone', nil];
		} else {
			_task = paros_kalochori4_tasks_array select (thisTrigger getVariable 'paros_kalochori4_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['paros_kalochori4_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach paros_kalochori4_liste_localisations;

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

//Déclencheur otage
_trigger_hostage = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_hostage triggerAttachVehicle [(_hostage_array select 0)];
_trigger_hostage setTriggerArea [2, 3, 23, true];
_trigger_hostage setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['paros_kalochori4_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["paros_kalochori4_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "paros_kalochori4_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_paros_kalochori4_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "paros_kalochori4_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_paros_kalochori4";
LM_COMMANDER setVariable ['paros_kalochori4_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.