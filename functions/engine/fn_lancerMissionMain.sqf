//exec: server
//instance: unique

private ["_trouve", "_trouve_count", "_mission", "_mission_name", "_zone"];
_trouve = false;
_trouve_count = 0;

// --------------------------------------------- SELECTION DE LA MISSION ---------------------------------------------
while {!_trouve && _trouve_count < 1000} do 
{
	_fob = LM_LISTE_FOB call BIS_fnc_selectRandom;
	_num_fob = -1;
	_zone = switch (_fob) do 
	{
		case "greenvalley": { _num_fob = 0; LM_LISTE_FOB_GREENVALLEY call BIS_fnc_selectRandom };
		case "highwatch": { _num_fob = 1; LM_LISTE_FOB_HIGHWATCH call BIS_fnc_selectRandom };
		case "roadtrip": { _num_fob = 2; LM_LISTE_FOB_ROADTRIP call BIS_fnc_selectRandom };
		case "southblues": { _num_fob = 3; LM_LISTE_FOB_SOUTHBLUES call BIS_fnc_selectRandom };
		case "base": { _num_fob = 4; LM_LISTE_FOB_BASE call BIS_fnc_selectRandom };
	};
	_num = ["main",_fob,_zone] call LM_fnc_getRandomMissionNumber;
	_mission_name = format["%1%2", _zone, _num];
	_trouve_count = _trouve_count + 1;
	if(!(_zone in (LM_MISSION_DONE select _num_fob)) && (LM_MISSION_FOBS select _num_fob isEqualTo "LOCKED")) then
	{
		LM_MISSION_NUM_FOB = _num_fob;
		_mission = format["fob\%1\main\%2\%3.sqf", _fob, _zone, _mission_name];
		_trouve = true;
	};
};
if(_trouve_count == 1000) exitWith { ["Impossible de trouver une mission jouable"] call LM_fnc_showGlobalMissionError; };




// --------------------------------------------- EXECUTION DE LA MISSION ---------------------------------------------

// Création du handle et exécution
_handle = execVM _mission;

if(isNil "_handle") then
{
	[format["Le lancement de %1 a lamentablement échoué", _mission_name]] call LM_fnc_showGlobalMissionError;
} else {
	LM_MISSION_STARTED = true;
	publicVariable "LM_MISSION_STARTED";
	waitUntil{ !(LM_MISSION_POSITION isEqualTo [0,0]) && (LM_MISSION_NUM_FOB!=-1) };
	_marker_mission = [format ["_marker_mission_%1",_zone],LM_MISSION_POSITION,"colorOPFOR","ELLIPSE",500] call LM_fnc_markerCreation;
	sleep 3; //temps pour initialiser la mission
	

	// Population ennemie
	call LM_fnc_populateZone;
	
	if(count allGroups >= 250) then { ["Nombre de groupes existants a atteint 250"] call LM_fnc_showGlobalMissionError; };

	// Attente de la fin de la mission
	waitUntil{scriptDone _handle};

	// Création du trigger de controle
	_trigger = createTrigger ["EmptyDetector", LM_MISSION_POSITION, false];
	_trigger setTriggerArea [1000, 1000, 0, false];
	_trigger setTriggerActivation ["WEST", "NOT PRESENT", true];
	_trigger setTriggerStatements ["this", "", ""];
	waitUntil{triggerActivated _trigger};

	// Trigger activé, on fait le ménage
	{deleteVehicle _x} forEach LM_MISSION_TEMP;
	LM_MISSION_TEMP = [];
	LM_MISSION_POPULATE = LM_MISSION_POPULATE_DEFAULT;
	LM_MISSION_ALERTE = false;
	sleep 5;
	_marker_mission setMarkerColor "colorIndependent";
	{ [_x] call BIS_fnc_deleteTask } forEach ([LM_MISSION_MAIN_TASK] call BIS_fnc_taskChildren);
	// Mise à jour des moniteurs
	[LM_MISSION_NUM_FOB, "DONE", _zone, _marker_mission, LM_MISSION_MAIN_TASK] call LM_fnc_updateStatus;
	LM_MISSION_POSITION = [0,0];
	LM_MISSION_MAIN_TASK = "";
	LM_MISSION_NUM_FOB = -1;
	deleteVehicle _trigger;
	LM_MISSION_STARTED = false;
	publicVariable "LM_MISSION_STARTED";

	// Sauvegarde de l'état
	call LM_fnc_saveMissionState
};
