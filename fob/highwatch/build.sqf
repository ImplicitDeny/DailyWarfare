// ------ Construction FOB HighWatch -----
// Author : [LM]Cheitan
// Team   : La Muerta

// ["High Watch", "MissionEngineFobUnlock"] call LM_fnc_showGlobalMissionNotification; =======> TODO, implémentation du vrai système de construction
// Spawn du drapeau
_pos = getMarkerPos "marker_fob_highwatch";
_object = createVehicle ["Flag_NATO_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 0;
_object setPosATL _pos;
(LM_MISSION_FOB_TEMP select 1) pushBack _object;

// _fortif = [] execVM "fob\greenvalley\build_fortifications.sqf";
// _buildings = [] execVM "fob\greenvalley\build_buildings.sqf";
// _communication = [] execVM "fob\greenvalley\build_communication.sqf";
// _weapons = [] execVM "fob\greenvalley\build_weapons.sqf";
	
["task_fob_highwatch","defend"] call BIS_fnc_taskSetType;
_current = ["task_fob_highwatch"] call BIS_fnc_taskDescription;
["task_fob_highwatch", ["Etat : ACTIF<br/><br/>Le FOB est actif. Diverses missions secondaires vous seront attribuées dans cette région à l'avenir.", (_current select 1), (_current select 2)]] spawn BIS_fnc_taskSetDescription;
["High Watch", "MissionEngineFobActive"] call LM_fnc_showGlobalMissionNotification;

[1, "INIT"] call LM_fnc_updateStatus;
_nul = [1, "highwatch"] execVM "side_engine.sqf";