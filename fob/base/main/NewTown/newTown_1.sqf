// ------ Reclaim_newTown1_main ------
// Author : [LM] Syh
// Team   : La Muerta

//Création du markeur zone de mission
_marker_newTown_Main1 = createMarker ["marker_newTown_Main1",[11400,14200]];
_marker_newTown_Main1 setMarkerShape "ELLIPSE";
_marker_newTown_Main1 setMarkerSize [100,100];

//"initialisation de la tâche"

[WEST,["Reclaim_newTown1_main"],["L'ennemi a enfoncé nos lignes de manière inacceptable, au point d'établir une zone de non-vol sur notre base. L'assaut est iminent et il nous faut contre-attaquer au plus vite. Neutralisez tout ce qui appartient à l'ennemi.","Opération Retour au paradis","_marker_newTown_Main1"],objNull, true, 1, true] call BIS_fnc_taskCreate; //<== FIXME changer le nom d'opération
LM_MISSION_MAIN_TASK = "Reclaim_newTown1_main";
LM_MISSION_POSITION = getMarkerPos "marker_newTown_Main1";

//Création groupes mécanisés
//Gorgon
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
_Embarquement setTriggerArea [800,800,0, false, 500];
if (triggerActivated _Embarquement) then {
	_Gorgon_Team_array orderGetIn true;
	_Ifrit_Team_array orderGetIn true;
};


//Contruction Building

_type_array = ["KICC_ARTILLEUR","KICC_FUSILIER","KICC_OP_RADIO","KICC_SL","KICC_TIREUR_PRECISION"];
_position_array = [[11433.556,14231.354,12.275],[11443.356,14226.574,12.274],[11448.53,14247.064,12.704],[11438.795,14245.26,12.314],[11455.455,14229.727,12.776]];
_direction_array = [[224.619],[206.472],[0],[346.498],[115.938]];
_group_soutien_1 = createGroup [EAST, true];
_inconscients_array = [];
{
	_type = _type_array call BIS_fnc_selectRandom;
	_unit = _group_soutien_1 createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit; //FIXME utiliser le bon système pour garbage collecter les unités

} forEach _position_array;

_type_array = ["KICC_FUSILIER","KICC_FUSILIER_AC","KICC_GRENADIER","KICC_MEDIC","KICC_FUSILIER_AUTO","KICC_OPE_RADIO","KICC_EXPLO","KICC_TL"];
_position_array = [[14872.626,10727.302,0],[14874.379,10734.943,1.062],[14884.582,10749.379,0],[14874.686,10727.178,0],[14881.073,10741.468,0],[14879.148,10729.131,0.127],[14877.118,10734.753,0.483],[14876,10727.097,0]];
_direction_array = [[328.192],[0],[328.971],[84.096],[350.947],[59.950],[0],[59.950];
_group_assaut_1 = createGroup [EAST, true];
_inconscients_array = [];
{
	_type = _type_array call BIS_fnc_selectRandom;
	_unit = _group_LM createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit; //FIXME utiliser le bon système pour garbage collecter les unités

} forEach _position_array;