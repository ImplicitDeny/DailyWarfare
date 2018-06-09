// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [14391.411133,11469.164063,-4.45828];
_boat = createVehicle ["C_Boat_Civil_04_F", _pos, [], 0, "CAN_COLLIDE"];
_boat setDir 0.0425218;
_boat setPosASL _pos;


_pos = [14391.591797,11461.22168,2.21408];
_target = createVehicle ["B_CargoNet_01_ammo_F", _pos, [], 0, "CAN_COLLIDE"];
_target setDir 0.127068;
_target setPosASL _pos;
(LM_MISSION_FOB_TEMP select 0) pushBack _target;



_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_fob_greenvalley", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [20, 20, 0, false];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "
	['task_greenvalley_side4', 'SUCCEEDED'] call BIS_fnc_taskSetState;
", ""];

[WEST,["task_greenvalley_side4","task_fob_greenvalley"],["Un navire civil devait nous livrer du matériel ce matin. Petit soucis, nous n'avons pas les moyens de le faire débarquer dans des circonstances pratiques près de <marker name='marker_fob_greenvalley'>Green Valley</marker>, où il doit livrer le matériel. De plus nous ne disposons pas d'embarcation suffisamment importante pour transporter la caisse de matériel concernée. Le transfert se fera donc par hélicoptère : hélitreuillez la caisse de matériel depuis le navire jusqu'au FOB.", "Hélitreuillage maritime", ""],_boat,true,1,true] call BIS_fnc_taskCreate;
["task_greenvalley_side4","boat"] call BIS_fnc_taskSetType;


waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;
deleteVehicle _boat;
