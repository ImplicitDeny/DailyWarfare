//exec: server
//instance: unique

//variable transcrivant l'état actuel du générateur de missions
LM_MISSION_STARTED = false;
publicVariable "LM_MISSION_STARTED";
//variable rendant accessible le "centre" de la zone de mission actuelle, utile pour les scripts de population ennemie
LM_MISSION_POSITION = [0,0];
//variable stockant le numéro de zone actuellement en cours, -1 si aucune mission lancée
LM_MISSION_NUM_FOB = -1;
//tableau d'objets à supprimer
LM_MISSION_TEMP = [];
//référence vers la tâche principale de la mission en cours
LM_MISSION_MAIN_TASK = "";
//tableau de stockage des objets FOB - inutilisé ?
LM_MISSION_FOB_TEMP = [[],[],[],[]];
//tableau de stockage des sides effectuées
LM_MISSION_SIDES = [[],[],[],[]];
//tableau de configuration des scripts de population : batiments militaires, abris industriels, hélipads, tours solaires, patrouilles, nombre minimum d'unités, alarme audible
LM_MISSION_POPULATE_DEFAULT = [true, true, true, true, true, 60, true];
LM_MISSION_POPULATE = LM_MISSION_POPULATE_DEFAULT;



// IN PROGRESS
/*
 * 0, greenvalley = sud-ouest
 * 1, highwatch = nord-ouest
 * 2, roadtrip = nord-est
 * 3, southblues = sud-est
 * 4, base = central, inutilisé pour le moment
*/
LM_LISTE_FOB = ["greenvalley", "highwatch", "southblues", "roadtrip"];
LM_LISTE_FOB_GREENVALLEY = ["agios_dionysios", "kavala", "panochori", "zaros"];
LM_LISTE_FOB_HIGHWATCH = ["mars", "negades", "oreokastro"];
LM_LISTE_FOB_ROADTRIP = ["paros_kalochori", "sofia", "pefkas"];
LM_LISTE_FOB_SOUTHBLUES = ["carriere", "chalkeia"];

// Liste de mains effectuées pour chaque FOB
LM_MISSION_DONE = [[],[],[],[]];
// Liste des marqueurs associés à chaque FOB
LM_MISSION_MARKERS = [[],[],[],[]];
// Liste des tâches associés à chaque FOB
LM_MISSION_TASKS = [[],[],[],[]];
// Moniteurs de l'état des FOB, LOCKED, OPEN, ACTIVE
LM_MISSION_FOBS = ["LOCKED", "LOCKED", "LOCKED", "LOCKED"];


[WEST,"task_fob_greenvalley",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "Green Valley", "marker_fob_greenvalley"],getMarkerPos "marker_fob_greenvalley",false,1,false] call BIS_fnc_taskCreate;
["task_fob_greenvalley","wait"] call BIS_fnc_taskSetType;
[WEST,"task_fob_highwatch",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "High Watch", "marker_fob_highwatch"],getMarkerPos "marker_fob_highwatch",false,1,false] call BIS_fnc_taskCreate;
["task_fob_highwatch","wait"] call BIS_fnc_taskSetType;
[WEST,"task_fob_roadtrip",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "Roadtrip", "marker_fob_roadtrip"],getMarkerPos "marker_fob_roadtrip",false,1,false] call BIS_fnc_taskCreate;
["task_fob_roadtrip","wait"] call BIS_fnc_taskSetType;
[WEST,"task_fob_southblues",["Etat : VERROUILLÉ<br/><br/>Pour déverrouiller un FOB, sécurisez la région en réalisant suffisamment de missions principales dans le secteur.", "South Blues", "marker_fob_southblues"],getMarkerPos "marker_fob_southblues",false,1,false] call BIS_fnc_taskCreate;
["task_fob_southblues","wait"] call BIS_fnc_taskSetType;

// Chargement des anciennes variables;
LM_MISSION_REINIT = profileNamespace getVariable ["LM_MISSION_REINIT", false];
if(LM_MISSION_REINIT) then {
	call LM_fnc_switchReinitValue;
} else {
	call LM_fnc_loadMissionState;
};