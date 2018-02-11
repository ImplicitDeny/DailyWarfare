// ------ Otages Agios Dionysios -----
// Author : [LM]Stark
// Date   : 17/05/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_agios_dionysios2 = createMarker ["marker_agios_dionysios2", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "AgiosDionysios" >> "position")]; "marker_agios_dionysios2" setMarkerType "Empty";
agios_dionysios2_liste_localisations = [[9035,15790],[9305,15785],[9345,15945],[9575,15950]];
[WEST,["task_agios_dionysios2_hostage_main"],["Le KICC retient des civils en otage à <marker name='marker_agios_dionysios2'>Agios Dionysios</marker>, espérant s'en servir comme monnaie d'échange contre certains de leurs officiers que nous avons capturé. Les otages n'ont pas pu être localisés avec précision mais quatre localisations potentielles ont été isolées, ils sont retenus sur l'une d'entres elles. Ramenez les otages à la base, dans la pièce marquée sur carte.", "Monnaie d'échange", "marker_agios_dionysios2"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_agios_dionysios2_hostage_main","meet"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios2_hostage_a","task_agios_dionysios2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle A", ""],(agios_dionysios2_liste_localisations select 0),false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios2_hostage_a","meet"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios2_hostage_b","task_agios_dionysios2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle B", ""],(agios_dionysios2_liste_localisations select 1),false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios2_hostage_b","meet"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios2_hostage_c","task_agios_dionysios2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle C", ""],(agios_dionysios2_liste_localisations select 2),false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios2_hostage_c","meet"] call BIS_fnc_taskSetType;
[WEST,["task_agios_dionysios2_hostage_d","task_agios_dionysios2_hostage_main"],["Otages trouvés : N/A", "Cellule potentielle D", ""],(agios_dionysios2_liste_localisations select 3),false,1,false] call BIS_fnc_taskCreate;
["task_agios_dionysios2_hostage_d","meet"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_agios_dionysios2_hostage_main";
LM_MISSION_POSITION = getMarkerPos "marker_agios_dionysios2";

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
		_position_array_gardes = [[9033.77,15789.3,1.14221],[9036.02,15792.4,0.803001]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9033.41,15792.7,0.949509],[9031.64,15792.1,1.14083]];
		_direction_array_otages = [187,122];
		LM_COMMANDER setVariable ['agios_dionysios2_zone', 0, false];
	};
    case 1: {
		_position_array_gardes = [[9301.81,15784.9,4.7745],[9297.52,15783.3,1.60243]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9303.89,15786.5,4.81136],[9304.62,15784.6,4.54361]];
		_direction_array_otages = [226,272];
		LM_COMMANDER setVariable ['agios_dionysios2_zone', 1, false];
	};
    case 2: {
		_position_array_gardes = [[9345.66,15943.3,0.920158],[9345.35,15937.2,0.248451]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9344.71,15945.4,1.16219],[9346.3,15945.2,1.118]];
		_direction_array_otages = [155,220];
		LM_COMMANDER setVariable ['agios_dionysios2_zone', 2, false];
	};
    case 3: {
		_position_array_gardes = [[9573.91,15949.1,3.70071],[9576.02,15955.4,5.14]];
		_direction_array_gardes = [0,0];
		_position_array_otages = [[9574.07,15952.4,4.3316],[9572.12,15952.7,4.08667]];
		_direction_array_otages = [176,126];
		LM_COMMANDER setVariable ['agios_dionysios2_zone', 3, false];
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

agios_dionysios2_tasks_array = ["task_agios_dionysios2_hostage_a", "task_agios_dionysios2_hostage_b", "task_agios_dionysios2_hostage_c", "task_agios_dionysios2_hostage_d"];

{
	_trigger_prox = createTrigger ["EmptyDetector",_x, false];
	_trigger_prox setVariable ["agios_dionysios2_trigger_indice", _forEachIndex, false];
	_trigger_prox setTriggerArea [5, 5, 0, false];
	_trigger_prox setTriggerActivation ["WEST", "PRESENT", false];
	_trigger_prox setTriggerStatements ["this", "
		if( (thisTrigger getVariable 'agios_dionysios2_trigger_indice') == (LM_COMMANDER getVariable 'agios_dionysios2_zone') ) then
		{
			{
				if(_forEachIndex != (LM_COMMANDER getVariable 'agios_dionysios2_zone')) then {
					[_x, 'CANCELED', false] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : NON"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				} else {
					[_x, 'SUCCEEDED', true] call BIS_fnc_taskSetState;
					[_x, [""Otages trouvés : OUI"", (([_x] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				};
			} forEach agios_dionysios2_tasks_array;
			LM_COMMANDER setVariable ['agios_dionysios2_zone', nil];
		} else {
			_task = agios_dionysios2_tasks_array select (thisTrigger getVariable 'agios_dionysios2_trigger_indice');
			[_task, 'CANCELED', true] call BIS_fnc_taskSetState;
			[_task, ['Otages trouvés : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
		};
		thisTrigger setVariable ['agios_dionysios2_trigger_indice', nil];
		deleteVehicle thisTrigger;
	", ""];
} forEach agios_dionysios2_liste_localisations;

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
	_group = createGroup [east, true];
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
_trigger_hostage setTriggerStatements ["this", "LM_COMMANDER setVariable ['agios_dionysios2_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( ({alive _x} count(units(_group_otages))) == 0 ) then { LM_COMMANDER setVariable ["agios_dionysios2_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "agios_dionysios2_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _hostage_array;
["task_agios_dionysios2_hostage_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "agios_dionysios2_reussite")), true] spawn BIS_fnc_taskSetState;
"marker_agios_dionysios2" setMarkerColor "colorIndependent";
LM_COMMANDER setVariable ['agios_dionysios2_reussite', nil];
deleteMarker "marker_agios_dionysios2";
deleteVehicle _trigger_hostage;

// ... end of mission's code, do not edit any of the lines bellow.