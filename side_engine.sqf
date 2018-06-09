//exec: server
//instance: multiple

params["_fobNum", "_fobName"];

// Log du démarrage
diag_log format ["--- %1 :: A SIDE ENGINE INSTANCE HAS STARTED FOR %2 ---", serverTime, _fobName];

// Récupération de la mission mère
_superTask = format["task_fob_%1",_fobName];

// Extraction du nom propre
_displayName = [_fobName] call LM_fnc_extraireNomPropre;

// Création des noms d'inscription auprès du commandant
_engineName = format["side_engine_%1",_fobName];

// Inscription de l'état auprès du commandant
LM_COMMANDER setVariable [_engineName, true, false];

// Compteur de missions
_compteur = 0;

// Inscription du travail de log à la crontab
[{diag_log format ["--- %1 :: SIDE ENGINE FOR %2 STILL RUNNING ---", serverTime, (_this select 1) select 0]},[_fobName],0,600,0] call RWT_fnc_cronJobAdd;



// Boucle principale
_nbMax = 1;
// _nbMax = 8 + floor(random 5);
while {_compteur < _nbMax} do {
	_trouve = false;
	_trouve_count = 0;
	_missionName = "";
	while {!_trouve && _trouve_count < 1000} do 
	{
		_missionName = format["side%1", (["side", _fobName] call LM_fnc_getRandomMissionNumber) ];
		_trouve_count = _trouve_count + 1;
		if!(_missionName in (LM_MISSION_SIDES select _fobNum)) then { _trouve = true; };
	};
	if!(_trouve) exitWith {
		["Impossible de trouver une mission secondaire jouable"] call LM_fnc_showGlobalMissionError;
	};
	_handle = [] execVM format["fob\%1\side\%2.sqf", _fobName, _missionName];
	(LM_MISSION_SIDES select _fobNum) pushBack _missionName;
	_compteur = _compteur + 1;
	waitUntil{ scriptDone _handle };
};

// Log de fin du moteur
diag_log format ["--- %1 :: SIDE ENGINE FOR %2 HAS TERMINATED ---", serverTime, _fobName];

// Retour au statut verrouillé
_current = [_superTask] call BIS_fnc_taskDescription;
[_superTask, ["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", (_current select 1), (_current select 2)]] spawn BIS_fnc_taskSetDescription;
[_superTask,"wait"] call BIS_fnc_taskSetType;
{ [_x] call BIS_fnc_deleteTask } forEach ([_superTask] call BIS_fnc_taskChildren);
LM_MISSION_SIDES set [_fobNum, []];
{ deleteVehicle _x } forEach (LM_MISSION_FOB_TEMP select _fobNum);
[_displayName, "MissionEngineFobLocked"] call LM_fnc_showGlobalMissionNotification;