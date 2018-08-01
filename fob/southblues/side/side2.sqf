// ------ Pararescue_Faronaki_side2 ------
// Author : [LM] Syh
// Team   : La Muerta



//Création de tâche
[WEST,["task_southblues_side2","task_fob_southblues"],["Un de nos groupes doit être évacué. Neuf personnels dont deux gravement blessés sont pris à partie vers Faronaki. Tous les moyens sont bons pour allez les chercher et amenez-les à <marker name='marker_fob_southblues'>South Blues</marker>.","Évacuation","marker_Faronaki_side2"],[14900,11000,0],true,1,true,"run"] call BIS_fnc_taskCreate;


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
		[_unit, true] call ace_medical_fnc_setUnconscious;
		_inconscients_array pushback _unit;
	};
} forEach _position_array;

//Création du markeur zone de mission
_marker_Faronaki_side2 = createMarker ["marker_Faronaki_side2",(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Faronaki" >> "position")];
_marker_Faronaki_side2 setMarkerShape "ELLIPSE";
_marker_Faronaki_side2 setMarkerSize [2500,2500];

//détection des joueurs
_trigger_Spawn_KICC = createTrigger ["EmptyDetector",getMarkerPos "marker_Faronaki_side2",false];
_trigger_Spawn_KICC setTriggerActivation ["ANYPLAYER","PRESENT",false];
_trigger_Spawn_KICC setTriggerArea  (getMarkerSize "marker_Faronaki_side2" append [0, false]);

//création des hostiles
waitUntil { sleep 5 ; triggerActivated _trigger_Spawn_KICC } ;
_groupe_KICC_1 = [[14992,11289,0], EAST, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;
_groupe_KICC_2 = [[15405.75,11349,0], EAST, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "soutien")] call BIS_fnc_spawnGroup;

//ordre attaque KICC ------------------------------------------- <-- FIXME?!? "_group_LM" fonctionne ou non?
_KICC1_Attack = _groupe_KICC_1 addWaypoint [_group_LM,0];
_KICC1_Attack setWaypointType "DESTROY";
_KICC2_Attack = _groupe_KICC_2 addWaypoint [_group_LM,0];
_KICC2_Attack setWaypointType "DESTROY";



//Détection des inconscients dans des véhicules TODO
_blesses_charges = {
	params["_inconscients"];
	_return = false;
	if(vehicle (_inconscients select 0) != (_inconscients select 0)) then {
		_return = (vehicle (_inconscients select 1) != (_inconscients select 1));
	};
	_return
};


// 1 (optionnel ?)
_marker_fusion_groupe = createMarker ["marker_fusion_groupe",[14777,10798,0]];
_marker_fusion_groupe setMarkerShape "ELLIPSE";
_marker_fusion_groupe setMarkerSize [200,200];


//Créer une fumigène sur un point (répété toutes les 60 secondes) --------------- ------- (là Syh s'amuse avec des choses dangereuses)
while {_trigger_Spawn_KICC == true} do {
waitUntil {sleep 60 }	_Smoke = "G_40mm_smokeBlue" createVehicle [14845,10731,0];
if(_return == true) exitwith {};
};

//2 (indépendant ?)
_trigger_fusion_groupe = createTrigger ["EmptyDetector",[14777,10798,0],false];
_trigger_fusion_groupe setTriggerActivation ["ANYPLAYER","PRESENT",false];
_trigger_fusion_groupe setTriggerArea [200,200,0,true,10];

// attendre le trigger
waitUntil { sleep 5 ; triggerActivated _trigger_fusion_groupe } ;

//détection des joueurs (intégrer boucle de sécurité?)
_playable_proche = nearestObjects [[14777,10798,0], _type_array, 300, false];
_players_proches = _playable_proche - _mission_unit_array //(_group_LM fonctionnel? pour remplacer _mission_unit_array)

//IA rejoindre PLAYERS
_mission_unit_array /*_group_LM si fonctionnel*/ join _players_proches;

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
_trigger_obj_IA setTriggerActivation [/*_mission_unit_array (créer string correspondant)*/,"PRESENT",false];
_trigger_obj_IA setTriggerArea [8,8,3];


_conditions_mission = {
	params["_objectifs"];
	_retry = false;
	if(_trigger_wonded_returned == true then {
		_retry = _trigger_obj_IA == true;
	};
	_retry
};

if(_conditions_mission == true) then /* Valider la mission" */;

/*
1 Création d'un marker sur zone
2 Si un joueur entre dans le marker => les IA rejoignent le groupe du joueur (Commande join ==> https://community.bistudio.com/wiki/join)
3 Création d'un marker objectif sur base
4 Le leader (joueur) ordonne aux IA de se rendre dans ce marker
5 Si les inconscients et les IA sont dans leurs zones respectives => succes et despawn
*/
