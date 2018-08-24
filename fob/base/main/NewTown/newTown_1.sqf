// ------ Reclaim_newTown_Main1 ------
// Author : [LM] Syh
// Team   : La Muerta

//Création du markeur zone de mission
_marker_newTown_Main1 = createMarker ["_marker_newTown_Main1",[11400,14200]];
_marker_newTown_Main1 setMarkerShape "ELLIPSE";
_marker_newTown_Main1 setMarkerSize [100,100];


//Création groupe mécanisé
_Mech_Team = createGroup [east, true];
_Mech_Member1 = _Mech_Team createUnit ["KICC_HOMME_EQUIPAGE", [11372.621,14090.733,0], [], 0, "CAN_COLLIDE"];
_Mech_Member1 setDir 147.815;
[_Mech_Member1, "REPAIR_VEH_STAND", "FULL"] call BIS_fnc_ambientAnimCombat;
_Mech_Member2 = _Mech_Team createUnit ["KICC_HOMME_EQUIPAGE", [11373.83,14090.571,0], [], 0, "CAN_COLLIDE"];
_Mech_Member3 = _Mech_Team createUnit ["KICC_HOMME_EQUIPAGE", [11377.809,14091.385,0], [], 0 ,"CAN_COLLIDE"];