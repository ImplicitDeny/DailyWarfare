// Sérialise les données de missions terminées

if(!isServer) exitWith {};

// Zones de missions effectuées, tableau 2D de strings, sérialisation directe
profileNamespace setVariable ["LM_MISSION_DONE", str LM_MISSION_DONE];

// Markers, on extrait le num de fob associé et la position, et on balance tout dans un 2D de strings
_markers = [[],[],[],[]];
{
	_fob = _forEachIndex;
	{
		(_markers select _fob) pushBack getMarkerPos _x;
	} forEach (LM_MISSION_MARKERS select _fob);
} forEach LM_MISSION_MARKERS;
profileNamespace setVariable ["LM_MISSION_MARKERS", str _markers];

// Tasks, on extrait le num de fob, la description, le type, le statut, et go 2D de strings
_tasks = [[],[],[],[]];
{
	_fob = _forEachIndex;
	{
		(_tasks select _fob) pushBack [
			_x call BIS_fnc_taskVar,
			_x call BIS_fnc_taskDescription,
			_x call BIS_fnc_taskType,
			_x call BIS_fnc_taskState];
	} forEach (LM_MISSION_TASKS select _fob);
} forEach LM_MISSION_TASKS;
profileNamespace setVariable ["LM_MISSION_TASKS", str _tasks];

// Ecriture du fichier
saveProfileNamespace;