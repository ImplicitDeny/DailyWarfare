// ------ Otages Chalkeia -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_chalkeia2 = createMarker ["marker_chalkeia2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Chalkeia" >> "position")]; "marker_chalkeia2" setMarkerType "Empty";
chalkeia2_liste_localisations = [[20345,11605],[20355,11790],[20180,11785],[20200,11620]];
[WEST,["task_chalkeia2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_chalkeia2'>Chalkeia</marker>, espérant s'en servir comme monnaie d'échange contre certains de leurs officiers que nous avons capturé. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Monnaie d'échange", "marker_chalkeia2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_chalkeia2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia2_hostage_a","task_chalkeia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(chalkeia2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia2_hostage_b","task_chalkeia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(chalkeia2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia2_hostage_c","task_chalkeia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(chalkeia2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia2_hostage_d","task_chalkeia2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(chalkeia2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_chalkeia2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_chalkeia2";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

// Barrages routiers
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
		_position_array_gardes = [[20340.5,11601,0.879967],[20346.6,11605,1.22776]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20342.8,11603.8,0.884811],[20341.2,11603.9,0.741348]];
		_direction_array_otages = [197,158];
		LM_COMMANDER setVariable ['chalkeia2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[20351.1,11787.9,4.21353],[20355.4,11789.6,3.70622]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20353.1,11788.9,3.95708],[20351.8,11790.6,4.4211]];
		_direction_array_otages = [256,201];
		LM_COMMANDER setVariable ['chalkeia2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[20180.3,11775.1,4.65689],[20182.3,11782.7,4.46424]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20181.7,11785.2,4.51048],[20183,11784.3,4.5221]];
		_direction_array_otages = [149,216];
		LM_COMMANDER setVariable ['chalkeia2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[20199.4,11618.6,4.15406],[20196.5,11619.3,4.30512]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[20198.6,11621.3,4.38607],[20200.3,11620.4,4.27423]];
		_direction_array_otages = [181,207];
		LM_COMMANDER setVariable ['chalkeia2_zone', 3, false];
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

chalkeia2_tasks_array = ["task_chalkeia2_hostage_a", "task_chalkeia2_hostage_b", "task_chalkeia2_hostage_c", "task_chalkeia2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["chalkeia2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'chalkeia2_trigger_indice') == (LM_COMMANDER getVariable 'chalkeia2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'chalkeia2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach chalkeia2_tasks_array;
			LM_COMMANDER setVariable ['chalkeia2_zone', nil];
		} else {
			_task = chalkeia2_tasks_array select (thisTrigger getVariable 'chalkeia2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['chalkeia2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach chalkeia2_liste_localisations;

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
_trigger_jet_support setTriggerStatements ["this", "[[0,0,250], getMarkerPos 'marker_chalkeia'] call LM_fnc_kiccJetSupport; deleteVehicle thisTrigger", ""];

//Déclencheur otage
_trigger_hostage = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_hostage triggerAttachVehicle [(_hostage_array select 0)];
_trigger_hostage setTriggerArea [2, 3, 23, true];
_trigger_hostage setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['chalkeia2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["chalkeia2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "chalkeia2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_chalkeia2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "chalkeia2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_chalkeia2";
LM_COMMANDER setVariable ['chalkeia2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.