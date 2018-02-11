// ------ Green Valley AA -----
// Author : [LM] Stark
// Team   : La Muerta

_pos_array = [[11039,9937.35,0],[10529.2,14351.5,0],[7635.35,13279.7,0],[5425.13,15822,0]];
_pos = selectRandom _pos_array;
_AA_array = [_pos] call LM_fnc_createAAPosition;
/*
(LM_MISSION_FOB_TEMP select 0) append _AA_array;
*/
_target_0 = _AA_array select 0;
_target_1 = _AA_array select 1;
[WEST,["task_greenvalley_side2","task_fob_greenvalley"],["L'ennemi à mis en place un site AA dans la région de South Blues et toute notre logistique aérienne est bloqué là-bas. Détruisez ce site pour que les lignes d'approvisionnement reprennent.", "Position antiaérienne", ""],_pos,true,1,true] call BIS_fnc_taskCreate;
["task_greenvalley_side2","destroy"] call BIS_fnc_taskSetType;

waitUntil {sleep 5; (!alive _target_0) and (!alive _target_1)};

["task_greenvalley_side2", "SUCCEEDED"] call BIS_fnc_taskSetState;