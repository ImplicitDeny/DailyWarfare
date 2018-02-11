// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [22234.117,8536.421,0];
_target = createVehicle ["B_Boat_Transport_01_F", _pos, [], 0, "NONE"];
_target setDir 52;
_target setPosASL _pos;
(LM_MISSION_FOB_TEMP select 3) pushBack _target;

_pos = [20269,8818,0];
_camion = createVehicle ["LM_ZAMAK", _pos, [], 0, "NONE"];
_camion setDir 150;
_camion setPosATL _pos;
(LM_MISSION_FOB_TEMP select 3) pushBack _camion;

_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_fob_southblues", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [6, 6, 0, false];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "['task_southblues_side1', 'SUCCEEDED'] call BIS_fnc_taskSetState;", ""];

[WEST,["task_southblues_side1","task_fob_southblues"],["Après un exercice de débarquement, un bateau de type semi-rigide a été oublié au lieu-dit Trachia. Un Zamak a été mis à votre disposition au FOB <marker name='marker_fob_southblues'>South Blues</marker> afin de vous permettre de récupérer cette embarcation et de la ramener au FOB.", "Embarcation oubliée", ""],_target,true,1,true] call BIS_fnc_taskCreate;
["task_southblues_side1","boat"] call BIS_fnc_taskSetType;


waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;