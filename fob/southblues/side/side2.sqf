// ------ Pararescue_Faronaki_side2 ------
// Author : [LM] Syh
// Team   : La Muerta



//Création de tâche
_marker_Faronaki_side2 = createMarker ["marker_Faronaki_side2",getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Faronaki" >> "position")];
[WEST,["task_southblues_side2","task_fob_southblues"],["Un de nos groupes doit être évacué. Neuf personnels dont deux gravement blessés sont pris à partie vers Faronaki. Tous les moyens sont bons pour allez les chercher et les amener à <marker name='marker_fob_southblues'>South Blues</marker>.","Évacuation","marker_Faronaki_side2"],[14900,11000,0],true,1,true,"run"] call BIS_fnc_taskCreate;

_mission_unit_array = [];

//Création du groupe à extraire
_type_array = ["LM_BASE_TL","LM_BASE_DEMO","LM_BASE_FUSILIER_AC","LM_BASE_MEDIC","LM_BASE_MITRAILLEUR","LM_BASE_OPERADIO","LM_BASE_SPECIALISTE_AC","LM_BASE_TL_RADIO","LM_BASE_PORTEUR_AC"];
_position_array = [[14872.626,10727.302,0],[14874.379,10734.943,1.062],[14884.582,10749.379,0],[14874.686,10727.178,0],[14881.073,10741.468,0],[14879.148,10729.131,0.127],[14877.118,10734.753,0.483],[14876,10727.097,0],[14877.181,10726.939,0]];
_direction_array = [[328.192],[0],[328.971],[84.096],[350.947],[59.950],[0],[59.950],[0]];
_group_LM = createGroup [WEST, true];
_inconscients_array = [];
{
	_type = _type_array call BIS_fnc_selectRandom;
	_unit = _group_LM createUnit [_type, _x, [], 0, "NONE"];
	_unit setPosATL _x;
	_unit disableAI "PATH";
	_mission_unit_array pushback _unit; //FIXME utiliser le bon système pour garbage collecter les unités

	//mise en inconscience de deux d'entre eux
	if(_forEachIndex == 7 || _forEachIndex == 8) then
	{ 
		[_unit, true, 3600, true] call ace_medical_fnc_setUnconscious;
		_inconscients_array pushback _unit;
	};
} forEach _position_array;

fumi = {
	"G_40mm_smokeBlue" createVehicle [14845,10731,0];
	sleep 60;
	if(LM_COMMANDER getVariable ["southblues_side2_fumi", true]) then { [] spawn fumi };
};

//détection des joueurs
_trigger_Spawn_KICC = createTrigger ["EmptyDetector",getMarkerPos "marker_Faronaki_side2",false];
_trigger_Spawn_KICC setTriggerActivation ["ANYPLAYER","PRESENT",false];
_trigger_Spawn_KICC setTriggerArea [2500,2500,0,false];
_trigger_Spawn_KICC setTriggerStatements ["this", "[] spawn fumi", "LM_COMMANDER setVariable ['southblues_side2_fumi', false]"];

//création des hostiles
waitUntil { sleep 5 ; triggerActivated _trigger_Spawn_KICC };
_groupe_KICC_1 = [[14992,11289,0], EAST, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;
_groupe_KICC_2 = [[15405.75,11349,0], EAST, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;

//ordre attaque KICC -------------------------------------------
_KICC1_Attack = _groupe_KICC_1 addWaypoint [getPos leader _group_LM,0];
_KICC1_Attack setWaypointType "DESTROY";
_KICC2_Attack = _groupe_KICC_2 addWaypoint [getPos leader _group_LM,0];
_KICC2_Attack setWaypointType "DESTROY";

//Créer une fumigène sur un point (répété toutes les 60 secondes) --> cf statements du trigger

//2 (indépendant ?)
_trigger_fusion_groupe = createTrigger ["EmptyDetector",getPos leader _group_LM,false];
_trigger_fusion_groupe setTriggerActivation ["ANYPLAYER","PRESENT",false];
_trigger_fusion_groupe setTriggerArea [100,100,0,false,10];
_trigger_fusion_groupe setTriggerStatements ["this", "", ""];

// attendre le trigger
waitUntil { sleep 5; triggerActivated _trigger_fusion_groupe };

// Fusionner _group_LM avec le groupe du joueur
{_x enableAI "PATH" } forEach units _group_LM; //rétablissement du path
units _group_LM join group (list _trigger_fusion_groupe select 0);

/*
//Création du marker objectif inconscients
_marker_obj_wonded = createMarker ["marker_obj_wonded",[14144.88,16246.116,0.581]];
_marker_obj_wonded setMarkerShape "RECTANGLE";
_marker_obj_wonded setMarkerSize [1,1,1];

_trigger_wonded_returned = createTrigger ["EmptyDetector",[14144.88,16246.116,0.581],false];
_trigger_wonded_returned setTriggerActivation ["_inconscients","PRESENT",false];
_trigger_wonded_returned setTriggerArea [1,1,22,true,2];

_marker_obj_IA = createMarker ["marker_obj_IA", [14135,16257,0]];
_marker_obj_IA setMarkerShape "RECTANGLE";
_marker_obj_IA setMarkerSize [8,8,3];

_trigger_obj_IA = createTrigger ["EmptyDetector",[14135,16257,0],false];
_trigger_obj_IA setTriggerActivation [_mission_unit_array,"PRESENT",false];
_trigger_obj_IA setTriggerArea [8,8,3];


//Mission accompli?
_conditions_mission = {
	params["_objectifs"];
	_retry = false;
	if(_trigger_wonded_returned == true then {
		_retry = _trigger_obj_IA == true;
	};
	_retry
};

if(_conditions_mission == true) then ;

//Mission échec
WaitUntil {sleep 5} if (!alive _group_LM) exitwith {}

*/

LM_COMMANDER setVariable ["southblues_side2_fumi", nil];

/*
1 Création d'un marker sur zone
2 Si un joueur entre dans le marker => les IA rejoignent le groupe du joueur (Commande join ==> https://community.bistudio.com/wiki/join)
3 Création d'un marker objectif sur base
4 Le leader (joueur) ordonne aux IA de se rendre dans ce marker
5 Si les inconscients et les IA sont dans leurs zones respectives => succes et despawn
*/

//testing commit