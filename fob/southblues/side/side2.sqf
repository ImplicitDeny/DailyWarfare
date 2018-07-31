// ------ Pararescue_Faronaki_side2 ------
// Author : [LM] Syh
// Team   : La Muerta

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

	//mise en inconcience de deux d'entre eux
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

//création des hostiles
waitUntil { sleep 5 ; triggerActivated _trigger_Spawn_KICC } ;
_groupe_KICC_1 = [[14992,11289,0], EAST, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;
_groupe_KICC_2 = [[15405.75,11349,0], EAST, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "soutien")] call BIS_fnc_spawnGroup;

//ordre attaque KICC
_KICC1_Attack = _groupe_KICC_1 addWaypoint [_group_LM,0];
_KICC1_Attack setWaypointType "DESTROY";
_KICC2_Attack = _groupe_KICC_2 addWaypoint [_group_LM,0];
_KICC2_Attack setWaypointType "DESTROY";

//Détection des inconscients dans des véhicules TODO
{

} forEach _inconscients_array;


//Création de tâche
[WEST,["task_southblues_side2","task_fob_southblues"],["Un de nos groupe doit être évacué. Neuf personnels dont deux blessés gravement sont pris à partie vers Faronaki. Tous les moyens sont bons. Allez les chercher et amenez-les à 'SouthBlues'.","Évacuation","marker_Faronaki_side2"],[14900,11000,0],true,1,true] call BIS_fnc_taskCreate;
["Évacuation","run"] call BIS_fnc_taskSetType;
