// ------ Otages Sofia -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_sofia2 = createMarker ["marker_sofia2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Sofia" >> "position")]; "marker_sofia2" setMarkerType "Empty";
sofia2_liste_localisations = [[25705,21315],[25755,21425],[25555,21365],[25770,21335]];
[WEST,["task_sofia2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_sofia2'>Sofia</marker>, espérant s'en servir comme monnaie d'échange contre certains de leurs officiers que nous avons capturé. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Monnaie d'échange", "marker_sofia2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_sofia2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_sofia2_hostage_a","task_sofia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(sofia2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_sofia2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_sofia2_hostage_b","task_sofia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(sofia2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_sofia2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_sofia2_hostage_c","task_sofia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(sofia2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_sofia2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_sofia2_hostage_d","task_sofia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(sofia2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_sofia2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_sofia2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_sofia2";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

//Configuration des barrages routiers
//Barrage E
_object = ["Land_CncBarrier_F",[25793.1,21441.4,0],126.754,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25795.8,21443.7,0],333.596,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25792.6,21447.2,0],298.220,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25790.1,21444.7,0],145.062,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25789.3,21447.9,0],43.830,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25796.4,21440.4,0],46.230,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

//Barrage W
_object = ["Land_CncBarrier_F",[25530.8,21194.1,0],133.817,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25533.7,21196.1,0],340.659,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25530.9,21199.9,0],305.283,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_CncBarrier_F",[25528.2,21197.7,0],152.125,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25527.7,21201,0],50.893,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;
_object = ["Land_HBarrier_5_F",[25533.9,21192.8,0],53.293,"SURFACE_NORMAL",false] call LM_fnc_objectCreation; _mission_object_array pushback _object;

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
		_position_array_gardes = [[25699.3,21313.4,0.376389],[25691.1,21315.9,0.429514]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[25703.4,21317.3,0.459429],[25704.2,21315,0.526262]];
		_direction_array_otages = [248,287];
		LM_COMMANDER setVariable ['sofia2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[25751,21425.4,3.92478],[25751,21425.4,3.92478]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[25754.9,21425.1,3.91459],[25756.3,21424.4,3.91603]];
		_direction_array_otages = [216,243];
		LM_COMMANDER setVariable ['sofia2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[25555.2,21360.5,3.64936],[25559.1,21363.5,3.60356]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[25553.7,21362.9,3.57012],[25555.9,21362.8,3.588]];
		_direction_array_otages = [142,173];
		LM_COMMANDER setVariable ['sofia2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[25771.5,21331.1,0.434658],[25775.9,21335.7,0.372591]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[25771.5,21333.5,0.374435],[25773,21333.5,0.401833]];
		_direction_array_otages = [158,201];
		LM_COMMANDER setVariable ['sofia2_zone', 3, false];
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

sofia2_tasks_array = ["task_sofia2_hostage_a", "task_sofia2_hostage_b", "task_sofia2_hostage_c", "task_sofia2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["sofia2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'sofia2_trigger_indice') == (LM_COMMANDER getVariable 'sofia2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'sofia2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach sofia2_tasks_array;
			LM_COMMANDER setVariable ['sofia2_zone', nil];
		} else {
			_task = sofia2_tasks_array select (thisTrigger getVariable 'sofia2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['sofia2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach sofia2_liste_localisations;

//Garnison
_position_defend_array = [[25822.9,21441.1,0],[25830.3,21447.4,0],[25719.6,21269.4,0],[25709,21279.1,0],[25551.3,21452.3,0],[25557,21446.8,0]];
_direction_defend_array = [140,135,50,40,225,220];
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
_position_array = [[25791.7,21448.9,0],[25798.1,21442.3,0],[25526.5,21198.6,0],[25531.1,21192.1,0]];
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
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['sofia2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["sofia2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "sofia2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_sofia2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "sofia2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_sofia2";
LM_COMMANDER setVariable ['sofia2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.