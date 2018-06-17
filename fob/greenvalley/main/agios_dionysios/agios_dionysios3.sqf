// ------ Informateur Agios Dionysios -----
// Author : [LM] Cheitan
// Team   : La Muerta

//----------Initialisation de l'environnement----------
_liste_localisations = [[9250,15950,0],[9450,15950,0],[9350,15850,0]];
_emplacement = floor(random 3);
marker_agios_dionysios3 = createMarker ["marker_agios_dionysios3", (_liste_localisations select _emplacement)]; "marker_agios_dionysios3" setMarkerType "mil_unknown";
[WEST,["task_agios_dionysios3_informer_main"],["Un soldat KICC nous fournissais des informations sur l'ennemi jusqu'à il y a encore quelques heures. Cet informateur a manqué son dernier cycle, puis nous a fait parvenir un signal de détresse. Sa dernière position connue était à <marker name='marker_agios_dionysios3'>Agios Dionysios</marker>. Nous le supposons en fuite. Le signal de détresse émet toujours mais faiblement, ce qui rend sa localisation difficile, à 50m près. Localisez et extrayez cet informateur.", "Informateur disparu", "marker_agios_dionysios3"],[14144.8,16246.2,0],true,1,true] call BIS_fnc_taskCreate;
["task_agios_dionysios3_informer_main","run"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_agios_dionysios3_informer_main";
LM_MISSION_POSITION = getMarkerPos "marker_agios_dionysios3";

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

// Ajustement de la Configuration
_posInfoArray = selectRandom (switch (_emplacement) do {
	case 0: {
		[[[9238.13,15951.3,0.00144196],109.631],
		[[9245.71,15950,0.00144196],31.4103],
		[[9226.44,15925.2,3.7951],163.612],
		[[9248.58,15910.7,0.338058],264.851],
		[[9271.29,15923.7,0.262001],4.5424],
		[[9284.51,15933.6,0.00134277],51.2144],
		[[9300.48,15954.8,0.694725],331.592],
		[[9300.32,15959,0.716293],352.985]]
	};
	case 1: {
		[[[9425,15928.3,0.00193787],279.841],
		[[9444.77,15939.9,0.00174713],236.34],
		[[9454.76,15972.2,0.00146484],207.614],
		[[9466,15973.9,0.696205],253.302],
		[[9466.82,15995,1.84129],279.775],
		[[9413.61,15970.7,0.00141907],19.5417]]
	};
	case 2: {
		[[[9308.31,15876.8,0.00141144],153.678],
		[[9328.65,15889,0.631882],328.054],
		[[9346.56,15890.2,0.00147247],67.7032],
		[[9366.27,15899.5,0.417915],234.207],
		[[9350.03,15869.3,0.645477],250.179],
		[[9328.74,15852.3,0.27507],254.988],
		[[9310.17,15824.3,3.27745],158.9]]
	};
});

//Spawn de l'informateur
_informer = (createGroup [east, true]) createUnit ["KICC_FUSILIER", (_posInfoArray select 0), [], 0, "CAN_COLLIDE"];
_informer setDir (_posInfoArray select 1);
_informer disableAI "ALL";
[_informer] spawn {
	params["_informer"];
	while {!(_informer getVariable ["ace_captives_isHandcuffed", false])} do {
		_move = 1 + floor(random 2);
		_informer playMoveNow format ["Acts_CivilHiding_%1", _move];
		sleep 10;
	};
};
_mission_unit_array pushBack _informer;


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
_trigger = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger triggerAttachVehicle [_informer];
_trigger setTriggerArea [2, 3, 23, true];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "LM_COMMANDER setVariable ['agios_dionysios3_reussite', true, false];", ""];


//----------Boucle principale----------
waitUntil
{
	if( !alive _informer ) then { LM_COMMANDER setVariable ["agios_dionysios3_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "agios_dionysios3_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
["task_agios_dionysios3_informer_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "agios_dionysios3_reussite")), true] spawn BIS_fnc_taskSetState;
"marker_agios_dionysios3" setMarkerColor "colorIndependent";
LM_COMMANDER setVariable ['agios_dionysios3_reussite', nil];
deleteMarker "marker_agios_dionysios3";
deleteVehicle _trigger;

// ... end of mission's code, do not edit any of the lines bellow.