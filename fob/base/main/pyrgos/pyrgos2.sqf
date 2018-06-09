// ------ Otages Pyrgos -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_pyrgos2 = createMarker ["marker_pyrgos2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Pyrgos" >> "position")]; "marker_pyrgos2" setMarkerType "Empty";
pyrgos2_liste_localisations = [[16555,12795],[16610,12485],[16850,12795],[16970,12620]];
[WEST,["task_pyrgos2_hostage_main"],["Les KICC retiennent des civils en otage à <marker name='marker_pyrgos2'>Pyrgos</marker> et s'en servent pour ralentir notre progression dans la région. Mettre fin à cette situation aiderait grandement nos troupes dans la zone. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Bouclier humain", "marker_pyrgos2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_pyrgos2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos2_hostage_a","task_pyrgos2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(pyrgos2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos2_hostage_b","task_pyrgos2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(pyrgos2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos2_hostage_c","task_pyrgos2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(pyrgos2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_pyrgos2_hostage_d","task_pyrgos2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(pyrgos2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_pyrgos2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_pyrgos2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_pyrgos2";

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
		_position_array_gardes = [[16555.9,12791.2,12.1659],[16552.5,12783,12.2012]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[16554.4,12794.7,12.15],[16556.2,12793.7,12.1651]];
		_direction_array_otages = [170,203];
		LM_COMMANDER setVariable ['pyrgos2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[16610.5,12486.7,4.40454],[16609.5,12484.7,0.639394]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[16608.1,12487.2,4.5443],[16610.1,12489.2,4.35526]];
		_direction_array_otages = [97,143];
		LM_COMMANDER setVariable ['pyrgos2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[16852.2,12790.2,0.384529],[16856.9,12794.8,0.570189]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[16852.2,12793.2,0.299137],[16853.9,12793.1,0.452023]];
		_direction_array_otages = [172,215];
		LM_COMMANDER setVariable ['pyrgos2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[16970.5,12619,4.15856],[16970.4,12620,0.291718]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[16970.4,12622,4.17248],[16971.8,12621.2,4.18103]];
		_direction_array_otages = [173,206];
		LM_COMMANDER setVariable ['pyrgos2_zone', 3, false];
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

pyrgos2_tasks_array = ["task_pyrgos2_hostage_a", "task_pyrgos2_hostage_b", "task_pyrgos2_hostage_c", "task_pyrgos2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["pyrgos2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'pyrgos2_trigger_indice') == (LM_COMMANDER getVariable 'pyrgos2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'pyrgos2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach pyrgos2_tasks_array;
			LM_COMMANDER setVariable ['pyrgos2_zone', nil];
		} else {
			_task = pyrgos2_tasks_array select (thisTrigger getVariable 'pyrgos2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['pyrgos2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach pyrgos2_liste_localisations;

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

//Déclencheur otage
_trigger_hostage = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_hostage triggerAttachVehicle [(_hostage_array select 0)];
_trigger_hostage setTriggerArea [2, 3, 23, true];
_trigger_hostage setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['pyrgos2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["pyrgos2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "pyrgos2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_pyrgos2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "pyrgos2_reussite")), true] spawn BIS_fnc_taskSetState;
LM_COMMANDER setVariable ['pyrgos2_reussite', nil];
deleteMarker "marker_pyrgos2";
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.