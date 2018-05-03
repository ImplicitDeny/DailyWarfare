/*[WEST,"task_fob_greenvalley",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "Green Valley", "marker_fob_greenvalley"],getMarkerPos "marker_fob_greenvalley",false,1,false] call BIS_fnc_taskCreate;
["task_fob_greenvalley","wait"] call BIS_fnc_taskSetType;*/

// Inscription du travail de log à la crontab
//[{systemChat format ["--- %1 :: MISSION ENGINE STILL RUNNING ---", serverTime]},[],0,600,0] call RWT_fnc_cronJobAdd;

params["_mission"];

// --------------------------------------------- EXECUTION DE LA MISSION ---------------------------------------------

// Création du handle et exécution
_handle = execVM format["zones\%1\init.sqf", _mission];

// Préinit et synchronisation
LM_MISSION_STARTED = true;
publicVariable "LM_MISSION_STARTED";
waitUntil{ !(LM_MISSION_POSITION isEqualTo [0,0]) };
sleep 3; //temps pour initialiser la mission

/*
	// Population ennemie
	call LM_fnc_populateZone;
	
	if(count allGroups >= 250) then { ["Nombre de groupes existants a atteint 250"] call LM_fnc_showGlobalMissionError; };

	// Log du lancement
	diag_log format ["--- MISSION :: %1 - #%2->%3 - avg. %4 FPS", serverTime, LM_MISSION_COUNT, _mission, diag_fps];
*/

LM_MISSION_MAIN_MARKER setMarkerColor "colorOpfor";

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
	//LM_MISSION_POPULATE = LM_MISSION_POPULATE_DEFAULT;
	//LM_MISSION_CASERNES = [];
	//LM_MISSION_ALERTE = false;
sleep 5;
LM_MISSION_MAIN_MARKER setMarkerColor "colorIndependent";
{ [_x] call BIS_fnc_deleteTask } forEach ([LM_MISSION_MAIN_TASK] call BIS_fnc_taskChildren);
// Mise à jour des moniteurs
LM_MISSION_POSITION = [0,0];
LM_MISSION_MAIN_TASK = "";
deleteVehicle _trigger;
LM_MISSION_STARTED = false;
publicVariable "LM_MISSION_STARTED";
	
// Stockage des valeurs dans le profile
profileNamespace setVariable ["LM_MISSION_DONE",LM_MISSION_DONE];
profileNamespace setVariable ["LM_MISSION_MARKERS",LM_MISSION_MARKERS];
profileNamespace setVariable ["LM_MISSION_TASKS",LM_MISSION_TASKS];
