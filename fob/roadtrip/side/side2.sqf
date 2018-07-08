// ------ Side satellite -----
// Author : [LM]Cheitan
// Team   : La Muerta

_objets = ["Land_WaterBottle_01_cap_F","Land_TorqueWrench_01_F","Land_BoreSighter_01_F","Land_TinContainer_F","Land_Sleeping_bag_folded_F","Land_FoodContainer_01_F"];

_marker_roadtrip_side2 = createMarker ["marker_roadtrip_side2", [26293.1,25941.1]];
"marker_roadtrip_side1" setMarkerType "ellipse";
"marker_roadtrip_side1" setMarkerSize [2500,700];
"marker_roadtrip_side1" markerDir 200;
"marker_roadtrip_side1" setMarkerBrush "Horizontal";
"marker_roadtrip_side1" setMarkerAlpha 0.5;
"marker_roadtrip_side1" setMarkerColor "ColorOrange";

_centre = [27940.6,25293.7,0];

{
	// Current result is saved in variable _x
	
} forEach _objets;








_pos = [23155.8,20204.1,0];
_target = createVehicle ["B_Quadbike_01_F", _pos, [], 0, "NONE"];
_target setDir 267;
_target setPosATL _pos;
(LM_MISSION_FOB_TEMP select 2) pushBack _target;

_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_roadtrip_side1", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [5, 10, 136.181, true, 6];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "['task_roadtrip_side1', 'SUCCEEDED'] call BIS_fnc_taskSetState;", ""];

[WEST,["task_roadtrip_side1","task_fob_roadtrip"],["Une recrue des unités de reconnaissance a effectué une mission d'entrainement en solitaire il y a peu dans la région de Roadtrip. Initialement déployé en quad, il est bien ennuyé car il ne se souvient pas où il l'a caché... Ne voulant pas être blâmé par ses supérieurs, il a discrètement fait appel à vous afin de lui ramener son quad. Il se souvient seulement l'avoir laissé dans les environs de Ioannina, dans la végétation. Trouvez le quad et cachez-le dans le <marker name='marker_roadtrip_side1'>grand hangar en métal</marker> à Ioannina, il viendra le récupérer discrètement plus tard.", "Eclaireur distrait", ""],getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Ioannina" >> "position"),true,1,true,"scout"] call BIS_fnc_taskCreate;


waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;
deleteMarker "marker_roadtrip_side1";