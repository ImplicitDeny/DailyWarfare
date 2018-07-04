// ------ Capture officier montagnes -----
// Author : [LM]Cheitan
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_montagnes_est1 = createMarker ["marker_montagnes_est1", [3532.63,19987.5,0]]; "marker_montagnes_est1" setMarkerType "Empty";
arrayCible = [
	[3529.99,19994.2,0.569122],
	[3881.03,20024.4,1.34166],
	[3651.68,19760.6,0.0246887],
	[3883.96,20219,0.417236],
	[3429.07,20248.5,0.7146]
];
[WEST,["task_me1_main"],["La présence KICC dans les <marker name='marker_montagnes_est1'>montagnes au Nord-Est</marker> est forte, bien que diffuse. Pour échapper à nos raids aériens l'ennemi a dispersé ses troupes en une multitude de petits camps, rendant les frappes aériennes très peu rentables. Toutefois, la surveillance informatique a permis d'identifier le téléphone d'un officier KICC important dans la zone, nom de code Spicy Muffin. Les environs comptent quelques batiments servant sans doute de QG ou d'entrepot, la cible se déplace fréquemment de l'un à l'autre en compagnie de quelques soldats. Interceptez et ramenez Spicy Muffin à la base en vie.", "Opération Spicy Muffin", "marker_montagnes_est1"],[14144.8,16246.2,0],true,1,true, "getin"] call BIS_fnc_taskCreate;
[WEST,["task_me1_pos","task_me1_main"],["Position actuelle du téléphone de la cible", "Spicy Muffin", "marker_montagnes_est1"],getMarkerPos "marker_montagnes_est1",false,1,false,"walk"] call BIS_fnc_taskCreate;

LM_MISSION_MAIN_TASK = "task_me1_main";
LM_MISSION_POSITION = getMarkerPos "marker_montagnes_est1";

LM_MISSION_POPULATE = [true, true, true, true, true, 60, false];

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];

// Spawn de la cible
_groupe = [[3534,19982,0], EAST, ["KICC_FUSILIER_FS","KICC_TIREUR_PRECISION_FS","KICC_FUSILIER_AUTO_FS"]] call BIS_fnc_spawnGroup;
officier = _groupe createUnit ["KICC_OFFICIER", [3534,19982,0], [], 0, "NONE"];
_groupe selectLeader officier;
{_mission_unit_array pushBack _x} forEach units _groupe;
_mission_unit_array pushBack officier;
["task_me1_pos", [officier, true]] call BIS_fnc_taskSetDestination;

// Création du parcours récursif
fn_movement = {
	sleep 5;
	_wp = (group officier) addWaypoint [selectRandom arrayCible, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointStatements ["true", "[] spawn fn_movement"];
};
_wp = (group officier) addWaypoint [selectRandom arrayCible, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointStatements ["true", "[] spawn fn_movement"];

//Déclencheur otage
_trigger = createTrigger ["EmptyDetector",[14144.8,16246.2,0], false];
_trigger triggerAttachVehicle [officier];
_trigger setTriggerArea [2, 3, 23, true];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "LM_COMMANDER setVariable ['me1_reussite', true, false];", ""];




//----------Boucle principale----------
waitUntil
{
	sleep 5;
	if( !alive officier ) then { LM_COMMANDER setVariable ["me1_reussite", false, false]; };
	!(isNil {LM_COMMANDER getVariable "me1_reussite"})
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
deleteMarker "marker_montagnes_est1";
["task_me1_main", (["FAILED","SUCCEEDED"] select (LM_COMMANDER getVariable "me1_reussite")), true] spawn BIS_fnc_taskSetState;
LM_COMMANDER setVariable ['me1_reussite', nil];
deleteVehicle _trigger;