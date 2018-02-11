//exec: server

params["_fob", "_action", ["_zone", ""], ["_marker", ""], ["_task", ""]];
_nombre = -1;
if(_action isEqualTo "INIT") then
{
	// Réinit des missions
	LM_MISSION_DONE set [_fob, []];
	// Réinit des markers
	{ deleteMarker _x } forEach (LM_MISSION_MARKERS select _fob);
	LM_MISSION_MARKERS set [_fob, []];
	// Réinit des tasks
	{ [_x] call BIS_fnc_deleteTask } forEach (LM_MISSION_TASKS select _fob);
	LM_MISSION_TASKS set [_fob, []];
} else {
	// Ajout de la mission
	(LM_MISSION_DONE select _fob) pushBack _zone;
	// Ajout du marker
	(LM_MISSION_MARKERS select _fob) pushBack _marker;
	// Ajout de la MainTask
	(LM_MISSION_TASKS select _fob) pushBack _task;
	// Update du status du FOB si nécessaire
	if(count (LM_MISSION_DONE select _fob) >= 3) then {
		LM_MISSION_FOBS set [_fob, "OPEN"];
		[_fob] call LM_fnc_openFob;
	};
};