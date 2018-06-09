// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [15025,21406,0];
_object = createVehicle ["O_static_AA_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;

[WEST,["task_side_greenvalley_test","task_fob_greenvalley"],["Flingue ça.", "Boum", ""],_object,true,1,true] call BIS_fnc_taskCreate;
["task_side_greenvalley_test","target"] call BIS_fnc_taskSetType;

waitUntil{ !alive _object };

["task_side_greenvalley_test", "SUCCEEDED"] call BIS_fnc_taskSetState;