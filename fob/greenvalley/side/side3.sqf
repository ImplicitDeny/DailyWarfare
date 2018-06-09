// ------ Green Valley Artillerie -----
// Author : [LM] Stark
// Team   : La Muerta

_pos_array = [[5481.16,15004.5,0],[6023.76,12612,0],[11945.6,12918.6,0],[12462.3,8435.98,0]];
_pos = selectRandom _pos_array;
_Artillery_array = [_pos] call LM_fnc_createArtilleryPosition;
/*
(LM_MISSION_FOB_TEMP select 0) append _Artillery_array;
*/
_target_0 = _Artillery_array select 0;
_target_1 = _Artillery_array select 1;
[WEST,["task_greenvalley_side3","task_fob_greenvalley"],["L'ennemi à mis en place un site d'artillerie lourde dans la région de South Blues. Détruisez ce site avant que nos positions ne soient détruites.", "Position d'artillerie lourde", ""],_pos,true,1,true] call BIS_fnc_taskCreate;
["task_greenvalley_side3","destroy"] call BIS_fnc_taskSetType;

waitUntil {sleep 5; (!alive _target_0) and (!alive _target_1)};

["task_greenvalley_side3", "SUCCEEDED"] call BIS_fnc_taskSetState;