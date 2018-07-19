// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [5745.226,11068.016,0];
_target = createVehicle ["LM_PROWLER", _pos, [], 0, "NONE"];
_target setDir 128;
_target setDamage [0.75, true];
_target setPosATL _pos;
(LM_MISSION_FOB_TEMP select 0) pushBack _target;

_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_fob_greenvalley", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [20, 20, 0, false];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "
	['task_greenvalley_side1', 'SUCCEEDED'] call BIS_fnc_taskSetState;
", ""];

[WEST,["task_greenvalley_side1","task_fob_greenvalley"],["Un de nos conducteurs de véhicule a manqué un virage près de Panochori. L'équipe est sortie indemne de l'accident mais le Prowler y est resté. Il est nécessaire de récupérer l'épave et de la ramener à <marker name='marker_fob_greenvalley'>Green Valley</marker> afin que nos mécaniciens y jettent un oeil.", "Prowler accidenté", ""],_target,true,1,true] call BIS_fnc_taskCreate;
["task_greenvalley_side1","repair"] call BIS_fnc_taskSetType;


waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;
