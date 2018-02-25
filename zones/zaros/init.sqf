// ------ Initialisation Zaros -----
// Author : [LM]Cheitan
// Team   : La Muerta

// Liste d'emplacements pour objectifs
_emplacements = ["stade", "bunker", "station"];

// Sélection du mode de jeu
_modes = ["CONQUETE"];
_mode = selectRandom _modes;





//----------Initialisation de l'environnement----------
marker_zaros2 = createMarker ["marker_zaros2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Zaros" >> "position")]; "marker_zaros2" setMarkerType "Empty";
zaros2_liste_localisations = [[9070,11890],[8965,12045],[9185,12015],[9230,11885]];
[WEST,["task_zaros2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_zaros2'>Zaros</marker>, espérant s'en servir comme monnaie d'échange contre certains de leurs officiers que nous avons capturé. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Monnaie d'échange", "marker_zaros2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_zaros2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_zaros2_hostage_a","task_zaros2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(zaros2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_zaros2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_zaros2_hostage_b","task_zaros2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(zaros2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_zaros2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_zaros2_hostage_c","task_zaros2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(zaros2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_zaros2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_zaros2_hostage_d","task_zaros2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(zaros2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_zaros2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_zaros2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_zaros2";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage A
_object = ["Land_CncBarrier_F",[9033.38,11781.6,0],298.952,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9031.36,11779.3,0],325.865,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9037.15,11779.1,0],304.126,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9035.95,11776.2,0],276.849,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9040.51,11780.2,0],201.211,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9031.86,11785.3,0],216.087,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage B
_object = ["Land_CncBarrier_F",[9322.98,11888.7,0],221.387,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9321.72,11894.4,0],199.649,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9324.87,11893.9,0],172.371,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9320.26,11890.1,0],194.474,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9319.85,11897.3,0],96.733,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[9316.98,11887.5,0],111.609,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage C
_object = ["Land_CncBarrier_F",[8939.87,11994.4,0],43.483,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8940.92,11988.7,0],21.745,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8937.79,11989.3,0],354.467,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8942.54,11993,0],16.570,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[8945.84,11995.2,0],293.705,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[8942.59,11984.6,0],281.571,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage D
_object = ["Land_CncBarrier_F",[8908.48,12122.5,0],13.721,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8912.22,12118.1,0],351.983,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8909.24,12117,0],324.705,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[8911.53,12122.6,0],346.808,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[8912.55,12125,0],262.315,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[8914.9,12116.4,0],262.315,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage E
_object = ["Land_CncBarrier_F",[9160.85,12099.2,0],179.335,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9156.14,12102.6,0],157.397,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9158.75,12104.4,0],130.319,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[9157.91,12098.4,0],152.422,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9152.75,12103.5,0],54.681,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_3_F",[9156.77,12095.4,0],68.235,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

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
		_position_array_gardes = [[9072.85,11889.8,4.13547],[9077.87,11892.8,4.548]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9071.07,11892.5,3.86098],[9072.99,11894.1,4.02586]];
		_direction_array_otages = [124,170];
		LM_COMMANDER setVariable ['zaros2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[8965.31,12041.6,5.05457],[8957.71,12041.4,4.73517]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[8965.1,12044.9,4.79239],[8966.97,12044.5,4.90091]];
		_direction_array_otages = [175,222];
		LM_COMMANDER setVariable ['zaros2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[9180.5,12013.1,0.597925],[9174.89,12014.9,0.378685]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9184.03,12014.1,0.630417],[9183.68,12016.5,0.605259]];
		_direction_array_otages = [304,242];
		LM_COMMANDER setVariable ['zaros2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[9232.95,11884.4,3.04647],[9229.5,11890.4,3.55385]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9231.23,11887.4,3.33938],[9230.58,11885.5,3.19572]];
		_direction_array_otages = [128,82];
		LM_COMMANDER setVariable ['zaros2_zone', 3, false];
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

zaros2_tasks_array = ["task_zaros2_hostage_a", "task_zaros2_hostage_b", "task_zaros2_hostage_c", "task_zaros2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["zaros2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'zaros2_trigger_indice') == (LM_COMMANDER getVariable 'zaros2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'zaros2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach zaros2_tasks_array;
			LM_COMMANDER setVariable ['zaros2_zone', nil];
		} else {
			_task = zaros2_tasks_array select (thisTrigger getVariable 'zaros2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['zaros2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach zaros2_liste_localisations;

//Garnison
_position_defend_array = [[9235.33,11976.2,0],[9242.56,11974.3,0],[8862.82,12162.3,0],[8861.52,12169.6,0],[9022.64,11737.1,0],[9017.48,11731.8,0]];
_direction_defend_array = [15,10,260,255,135,130];
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
_position_array = [[9031.12,11781.5,0],[9038.28,11777.3,0],[9321.26,11888,0],[9323.59,11895.5,0],[8938.03,11986.2,0],[8941.83,11995.5,0],[8911.79,12115.5,0],[8909.65,12124.1,0],[9159.7,12096.1,0],[9155.77,12105.4,0]];
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
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['zaros2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["zaros2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "zaros2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_zaros2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "zaros2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_zaros2";
LM_COMMANDER setVariable ['zaros2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.