//exec: server
//instance: unique

systemChat format ["--- %1 :: MISSION ENGINE HAS STARTED ---", serverTime];

// ----- CHARGEMENT DES VARIABLES PERSISTANTES
LM_MISSION_REINIT = profileNamespace getVariable ["LM_MISSION_REINIT", false];
publicVariable "LM_MISSION_REINIT";
LM_MISSION_COUNT = 0;
LM_MISSION_SUCCESS = 0;
LM_MISSION_SIDES = [[],[],[],[]];
LM_MISSION_DONE = [[],[],[],[],[]];
LM_MISSION_MARKERS = [[],[],[],[],[]];
LM_MISSION_TASKS = [[],[],[],[],[]];
LM_MISSION_FOBS = ["LOCKED", "LOCKED", "LOCKED", "LOCKED"];
if(!LM_MISSION_REINIT) then {
	LM_MISSION_COUNT = (profileNamespace getVariable ["LM_MISSION_COUNT",0]); //compteur du nombre de missions lancées
	LM_MISSION_SUCCESS = (profileNamespace getVariable ["LM_MISSION_SUCCESS",0]); //compteur de missions réussies
	LM_MISSION_SIDES = (profileNamespace getVariable ["LM_MISSION_SIDES",[[],[],[],[]]]); //tableau de stockage des sides effectuées
	LM_MISSION_DONE = (profileNamespace getVariable ["LM_MISSION_DONE",[[],[],[],[],[]]]); // Liste de mains effectuées pour chaque FOB
	LM_MISSION_MARKERS = (profileNamespace getVariable ["LM_MISSION_MARKERS",[[],[],[],[],[]]]); // Liste des marqueurs associés à chaque FOB
	LM_MISSION_TASKS = (profileNamespace getVariable ["LM_MISSION_TASKS",[[],[],[],[],[]]]); // Liste des tâches associés à chaque FOB
	LM_MISSION_FOBS = (profileNamespace getVariable ["LM_MISSION_FOBS",["LOCKED", "LOCKED", "LOCKED", "LOCKED"]]); // Moniteurs de l'état des FOB, LOCKED, OPEN, ACTIVE
};

// ----- CHARGEMENT DES VARIABLES DE MISSION

LM_ENGINE_STATE = true; //variable transcrivant l'état actuel du moteur, true = actif, false = inactif
LM_MISSION_STARTED = false; //variable transcrivant l'état actuel du générateur de missions
publicVariable "LM_MISSION_STARTED";
LM_MISSION_POSITION = [0,0]; //variable rendant accessible le "centre" de la zone de mission actuelle, utile pour les scripts de population ennemie
LM_MISSION_NUM_FOB = -1; //variable stockant le numéro de zone actuellement en cours, -1 si aucune mission lancée
LM_MISSION_TEMP = []; //tableau d'objets à supprimer
LM_MISSION_MAIN_TASK = ""; //référence vers la tâche principale de la mission en cours
LM_MISSION_FOB_TEMP = [[],[],[],[]]; //tableau de stockage des objets FOB

//tableau de configuration des scripts de population : batiments militaires, abris industriels, hélipads, tours solaires, patrouilles, nombre minimum d'unités, alarme audible, casernes
LM_MISSION_POPULATE_DEFAULT = [true, true, true, true, true, 60, true, true];
LM_MISSION_POPULATE = LM_MISSION_POPULATE_DEFAULT;
LM_MISSION_CASERNES = [];

// ----- RESET DE LA VALEUR DE REINIT
LM_MISSION_REINIT = false;
profileNamespace setVariable ["LM_MISSION_REINIT", false];
publicVariable "LM_MISSION_REINIT";

LM_LISTE_ZONES = ["zaros"];

[WEST,"task_fob_greenvalley",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "Green Valley", "marker_fob_greenvalley"],getMarkerPos "marker_fob_greenvalley",false,1,false] call BIS_fnc_taskCreate;
["task_fob_greenvalley","wait"] call BIS_fnc_taskSetType;
[WEST,"task_fob_highwatch",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "High Watch", "marker_fob_highwatch"],getMarkerPos "marker_fob_highwatch",false,1,false] call BIS_fnc_taskCreate;
["task_fob_highwatch","wait"] call BIS_fnc_taskSetType;
[WEST,"task_fob_roadtrip",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "Roadtrip", "marker_fob_roadtrip"],getMarkerPos "marker_fob_roadtrip",false,1,false] call BIS_fnc_taskCreate;
["task_fob_roadtrip","wait"] call BIS_fnc_taskSetType;
[WEST,"task_fob_southblues",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "South Blues", "marker_fob_southblues"],getMarkerPos "marker_fob_southblues",false,1,false] call BIS_fnc_taskCreate;
["task_fob_southblues","wait"] call BIS_fnc_taskSetType;

// Inscription du travail de log à la crontab
[{systemChat format ["--- %1 :: MISSION ENGINE STILL RUNNING ---", serverTime]},[],0,600,0] call RWT_fnc_cronJobAdd;