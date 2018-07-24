// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [9554,20143,0];
_target = createVehicle ["LM_ZAMAK_COVERED", _pos, [], 0, "NONE"];
_target setDir 150;
_target setFuel 0;
_target setPosATL _pos;
(LM_MISSION_FOB_TEMP select 1) pushBack _target;

_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_fob_highwatch", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [10, 10, 0, false];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "
	['task_highwatch_side1', 'SUCCEEDED'] call BIS_fnc_taskSetState;
", ""];

[WEST,["task_highwatch_side1","task_fob_highwatch"],["Un Zamak de transport est tombé en panne sèche non loin d'Abdera en tentant de rejoindre le FOB. L'équipe qui l'occupait a terminé le trajet a pied, mais le véhicule est toujours sur zone. Rendez-vous sur place afin de le réapprovisionner et l'acheminer jusqu'à <marker name='marker_fob_highwatch'>High Watch</marker>.", "Panne sèche", ""],_target,true,1,true,"refuel"] call BIS_fnc_taskCreate;

waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;
