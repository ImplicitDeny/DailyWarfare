// ------ INTEL CHALKEIA -----
// Author : [LM]Stark
// Date   : 21/04/17
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_chalkeia3 = createMarker ["marker_chalkeia3", getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Chalkeia" >> "position")]; "marker_chalkeia3" setMarkerType "Empty";
chalkeia3_liste_localisation = [[20263.2,11544.7,0.681534],[20281.2,11751.1,4.59068],[20378,11673.8,0.53083],[20146.4,11691.5,4.95789]];
[WEST,["task_chalkeia3_intel_main"],["Le KICC pense pouvoir installer les bureaux de ses officiers de terrain à <marker name='marker_chalkeia3'>Chalkeia</marker>. Nous ne savons pas exactement dans quel but ils ont choisi cette ville, mais nous n'allons pas les laisser faire. Rendez-vous sur place et récupérez tous les documents utiles que vous trouverez. Les localisations possibles pour des bureaux ont été marquées sur carte.", "Renseigmement préventif", ""],objNull,true,1,true] call BIS_fnc_taskCreate;
["task_chalkeia3_intel_main","documents"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia3_intel_a","task_chalkeia3_intel_main"],["Présence de documents : N/A", "Bureau potentiel A", ""],(chalkeia3_liste_localisation select 0),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia3_intel_a","documents"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia3_intel_b","task_chalkeia3_intel_main"],["Présence de documents : N/A", "Bureau potentiel B", ""],(chalkeia3_liste_localisation select 1),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia3_intel_b","documents"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia3_intel_c","task_chalkeia3_intel_main"],["Présence de documents : N/A", "Bureau potentiel C", ""],(chalkeia3_liste_localisation select 2),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia3_intel_c","documents"] call BIS_fnc_taskSetType;
[WEST,["task_chalkeia3_intel_d","task_chalkeia3_intel_main"],["Présence de documents : N/A", "Bureau potentiel D", ""],(chalkeia3_liste_localisation select 3),false,1,false] call BIS_fnc_taskCreate;
["task_chalkeia3_intel_d","documents"] call BIS_fnc_taskSetType;
LM_MISSION_MAIN_TASK = "task_chalkeia3_intel_main";
LM_MISSION_POSITION = getMarkerPos "marker_chalkeia3";

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
_intel_position_array = [
	[[20263.2,11544.3,1.50431],[20263.2,11545,1.49],[20263.1,11545.5,1.478],[20263.4,11545.2,1.49],[20263.2,11544.7,0.681534]],
	[[20280.8,11751.4,5.41697],[20281.4,11751,5.39495],[20281.9,11750.8,5.37534],[20281.5,11750.7,5.38374],[20281.2,11751.1,4.59068]],
	[[20378.3,11674.1,1.36208],[20377.8,11673.6,1.33241],[20377.5,11673.2,1.32079],[20377.5,11673.6,1.31721],[20378,11673.8,0.53083]],
	[[20146.9,11691.7,5.95909],[20146.2,11691.4,5.66629],[20145.8,11691.2,5.54203],[20145.9,11691.5,5.58955],[20146.4,11691.5,4.95789]]
];
_intel_direction_array = [
	[179.751,94.178,101.51,79.93,269.520],
	[300.656,215.082,222.414,200.834,30.424],
	[45.120,319.546,326.878,305.298,134.889],
	[64.149,338.576,345.907,324.327,153.918]
];

chalkeia_tasks_array = ["task_chalkeia3_intel_a", "task_chalkeia3_intel_b", "task_chalkeia3_intel_c", "task_chalkeia3_intel_d"];
_intel_array = [];
while {count _intel_array == 0} do
{
	{
		if((random 2) > 1) then {
			_mission_object_array pushback (["Land_Map_altis_F",_x select 0,(_intel_direction_array select _forEachIndex) select 0,"HORIZ",true] call LM_fnc_objectCreation);
			_intel = (["Land_File1_F",_x select 1,(_intel_direction_array select _forEachIndex) select 1,"HORIZ",true] call LM_fnc_objectCreation);
			_mission_object_array pushback (["Land_File_research_F",_x select 2,(_intel_direction_array select _forEachIndex) select 2,"HORIZ",true] call LM_fnc_objectCreation);
			_mission_object_array pushback (["Land_Photos_V1_F",_x select 3,(_intel_direction_array select _forEachIndex) select 3,"HORIZ",true] call LM_fnc_objectCreation);
			_mission_object_array pushback (["Land_CampingTable_F",_x select 4,(_intel_direction_array select _forEachIndex) select 4,"HORIZ",true] call LM_fnc_objectCreation);
			(_intel) setVariable ["chalkeia3_intel_indice", _forEachIndex, false];
			
			//création de l'interaction
			_task_temp = (chalkeia_tasks_array select _forEachIndex);
			_statement = {
				params["_target", "_player", "_arguments"];
				deleteVehicle _target;
				[(_arguments select 0), 'SUCCEEDED', true] spawn BIS_fnc_taskSetState;
				[(_arguments select 0), ['Présence de documents : OUI', (([(_arguments select 0)] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
			};
			[_intel,0,["ACE_MainActions"],(format ["ramasser_%1", _forEachIndex]),"Ramasser le document","",_statement,{true},{},[_task_temp]] call LM_fnc_createAceActionGlobal;
			_intel_array pushBack _intel;
		} else {
			_trigger = createTrigger ["EmptyDetector", (_x select 0), false];
			_trigger setVariable ["chalkeia3_intel_indice", _forEachIndex, false];
			_trigger setTriggerArea [5, 5, 0, false];
			_trigger setTriggerActivation ["WEST", "PRESENT", false];
			_trigger setTriggerStatements ["this", "
				_index = thisTrigger getVariable 'chalkeia3_intel_indice';
				_task = (chalkeia_tasks_array select _index);
				[_task, 'CANCELED', true] spawn BIS_fnc_taskSetState;
				[_task, ['Présence de documents : NON', (([_task] call BIS_fnc_taskDescription) select 1), '']] spawn BIS_fnc_taskSetDescription;
				deleteVehicle thisTrigger;
			", ""];
		};
	} forEach _intel_position_array;
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
_trigger_jet_support = createTrigger ["EmptyDetector", getMarkerPos "marker_chalkeia3", true];
_trigger_jet_support setTriggerArea [1000, 1000, 0, false];
_trigger_jet_support setTriggerActivation ["EAST", "WEST D", false];
_trigger_jet_support setTriggerStatements ["this", "[[0,0,250], getMarkerPos 'marker_chalkeia3'] call LM_fnc_kiccJetSupport; deleteVehicle thisTrigger;", ""];

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach chalkeia_tasks_array;
	_fin
};

//----------Suppression de l'environnement----------

{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _intel_array;
deleteMarker "marker_chalkeia3";
["task_chalkeia3_intel_main", 'SUCCEEDED', true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.