// ------ Otages Kalochori -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_paros_kalochori2 = createMarker ["marker_paros_kalochori2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Kalochori" >> "position")]; "marker_paros_kalochori2" setMarkerType "Empty";
paros_kalochori2_liste_localisations = [[21245,16325],[21335,16295],[21390,16375],[21450,16440]];
[WEST,["task_paros_kalochori2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_paros_kalochori2'>Kalochori</marker>, afin de nous empêcher d'effectuer des frappes aériennes dans la zone. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Bouclier humain", "marker_paros_kalochori2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_paros_kalochori2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori2_hostage_a","task_paros_kalochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(paros_kalochori2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori2_hostage_b","task_paros_kalochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(paros_kalochori2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori2_hostage_c","task_paros_kalochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(paros_kalochori2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_paros_kalochori2_hostage_d","task_paros_kalochori2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(paros_kalochori2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_paros_kalochori2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_paros_kalochori2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_paros_kalochori2";

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
		_position_array_gardes = [[21241.7,16317.3,4.17111],[21244.6,16323.5,4.14399]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[21243,16326,4.07295],[21244.6,16326.2,4.10926]];
		_direction_array_otages = [146,183];
		LM_COMMANDER setVariable ['paros_kalochori2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[21337.6,16295.1,0.722477],[21332.4,16300.8,0.39229]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[21337.1,16297.5,0.670801],[21338.7,16297.2,0.747065]];
		_direction_array_otages = [168,213];
		LM_COMMANDER setVariable ['paros_kalochori2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[21391.8,16371.4,0.249733],[21397,16368.2,0.49122]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[21392.3,16374.1,0.149977],[21393.8,16373.5,0.195223]];
		_direction_array_otages = [192,219];
		LM_COMMANDER setVariable ['paros_kalochori2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[21450.2,16438.1,0.499037],[21445.5,16441.8,0.377222]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[21452.3,16439.2,0.525171],[21451.1,16440.7,0.470045]];
		_direction_array_otages = [251,224];
		LM_COMMANDER setVariable ['paros_kalochori2_zone', 3, false];
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

paros_kalochori2_tasks_array = ["task_paros_kalochori2_hostage_a", "task_paros_kalochori2_hostage_b", "task_paros_kalochori2_hostage_c", "task_paros_kalochori2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["paros_kalochori2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'paros_kalochori2_trigger_indice') == (LM_COMMANDER getVariable 'paros_kalochori2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'paros_kalochori2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach paros_kalochori2_tasks_array;
			LM_COMMANDER setVariable ['paros_kalochori2_zone', nil];
		} else {
			_task = paros_kalochori2_tasks_array select (thisTrigger getVariable 'paros_kalochori2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['paros_kalochori2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach paros_kalochori2_liste_localisations;

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

//Déclencheur otage
_trigger_hostage = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger_hostage triggerAttachVehicle [(_hostage_array select 0)];
_trigger_hostage setTriggerArea [2, 3, 23, true];
_trigger_hostage setTriggerActivation ["GROUP", "PRESENT", true];
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['paros_kalochori2_reussite', true, false];", ""];

//Jet support
_trigger_jet_support = createTrigger ["EmptyDetector", getMarkerPos "marker_paros_kalochori2", false];
_trigger_jet_support setTriggerArea [1000, 1000, 0, false];
_trigger_jet_support setTriggerActivation ["EAST", "WEST D", false];
_trigger_jet_support setTriggerStatements ["this", "[[0,0,250], getMarkerPos 'marker_paros_kalochori2'] call LM_fnc_kiccJetSupport; deleteVehicle thisTrigger;", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["paros_kalochori2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "paros_kalochori2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_paros_kalochori2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "paros_kalochori2_reussite")), true] spawn BIS_fnc_taskSetState;
deleteMarker "marker_paros_kalochori2";
LM_COMMANDER setVariable ['paros_kalochori2_reussite', nil];
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.