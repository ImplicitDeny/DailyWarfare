// Restaure les données de missions sauvegardées

_done = parseSimpleArray (profileNamespace getVariable ["LM_MISSION_DONE", [[],[],[],[]] ]);
_markers = parseSimpleArray (profileNamespace getVariable["LM_MISSION_MARKERS", [[],[],[],[]] ]);
_tasks = parseSimpleArray (profileNamespace getVariable["LM_MISSION_TASKS", [[],[],[],[]] ]);

{
	_fob = _forEachIndex;
	{
		_marker = [format ["_marker_%1",_x],(_markers select _fob select _forEachIndex),"colorIndependent","ELLIPSE",500] call LM_fnc_markerCreation;

		_taskArray = _tasks select _fob select _forEachIndex;
		_t = [WEST, [_taskArray select 0]];
		_desc = [
			(_taskArray select 1 select 0 select 0),
			(_taskArray select 1 select 1 select 0),
			_marker
		];
		_t pushBack _desc;
		_t pushBack _marker; // destination
		_t pushBack (_taskArray select 3); // état
		_t pushBack 0; // priorité
		_t pushBack false; // pas de notif
		_t pushBack (_taskArray select 2); // type
		_task = _t call BIS_fnc_taskCreate; //création de la tâche

		[_fob, "RESTORE", _x, _marker, _task] call LM_fnc_updateStatus;
	} forEach (_done select _fob);
} forEach _done;


/*
[LM_MISSION_NUM_FOB, "DONE", _zone, _marker_mission, LM_MISSION_MAIN_TASK] call LM_fnc_updateStatus;
*/