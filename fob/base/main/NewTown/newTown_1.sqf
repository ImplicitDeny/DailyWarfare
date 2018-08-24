// ------ Reclaim_newTown_Main1 ------
// Author : [LM] Syh
// Team   : La Muerta

//Création du markeur zone de mission
_marker_newTown_Main1 = createMarker ["_marker_newTown_Main1",[11400,14200]];
_marker_newTown_Main1 setMarkerShape "ELLIPSE";
_marker_newTown_Main1 setMarkerSize [100,100];


//Création groupes mécanisés

//Marid
_Gorgon_Team = createGroup [EAST, true];
_Gorgon_Member1 = _Gorgon_Team createUnit ["KICC_HOMME_EQUIPAGE", [11372.887,14090.355,0], [], 0, "CAN_COLLIDE"];
_Gorgon_Member1 setDir 147.815;
_Gorgon_Member2 = _Gorgon_Team createUnit ["KICC_HOMME_EQUIPAGE", [11377.809,14091.385,0], [], 0 ,"CAN_COLLIDE"];
_Gorgon_Member2 setDir 127.663;
_Gorgon_Member3 = _Gorgon_Team createUnit ["KICC_HOMME_EQUIPAGE", [11373.83,14090.571,0], [], 0, "CAN_COLLIDE"];
_Gorgon_Member3 setDir 232.860;

_Gorgon_Team_array = [_Gorgon_Member1,_Gorgon_Member2,_Gorgon_Member3];

_Gorgon = "KICC_GORGON" createVehicle [11373.583,14088.064,0];

_Gorgon_Member1 assignAsDriver _Gorgon;
_Gorgon_Member2 assignAsGunner _Gorgon;
_Gorgon_Member3 assignAsCommander _Gorgon;

//animations
[_Gorgon_Member1, "REPAIR_VEH_STAND", "FULL"] call BIS_fnc_ambientAnimCombat; // <= Modèle de script d'animation (voir https://community.bistudio.com/wiki/BIS_fnc_ambientAnim)


//Ifrit
_Ifrit_Team = createGroup [EAST, true];
_Ifrit_Member1 = _Ifrit_Team createUnit ["KICC_FUSILIER", [11364.786,14150.27,0], [], 0, "CAN_COLLIDE"];
_Ifrit_Member1 setDir 99.857;
_Ifrit_Member2 = _Ifrit_Team createUnit ["KICC_FUSILIER", [11366.649,14149.44,0], [], 0, "CAN_COLLIDE"];
_Ifrit_Member2 setDir 305.724;

_Ifrit_Team_array = [_Ifrit_Member1,_Ifrit_Member2];

_Ifrit_HMG = "KICC_IFRIT_HMG" createVehicle [11367.851,14151.821,0];

_Ifrit_Member1 assignAsDriver _Ifrit_HMG;
_Ifrit_Member2 assignAsGunner _Ifrit_HMG;

//Détection OTAN = Embarquement
_Embarquement = createTrigger ["EmptyDetector",[11390,14197], false];
_Embarquement setTriggerActivation ["WEST","EAST D"];
_Embarquement setTriggerArea [600,600,0, false, 500];
if (triggerActivated _Embarquement) then {
	_Gorgon_Team_array orderGetIn true;
	_Ifrit_Team_array orderGetIn true;
};