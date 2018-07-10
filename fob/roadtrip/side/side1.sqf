// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [23155.8,20204.1,0];
_target = createVehicle ["B_Quadbike_01_F", _pos, [], 0, "NONE"];
_target setDir 267;
_target setPosATL _pos;
(LM_MISSION_FOB_TEMP select 2) pushBack _target;

_marker_roadtrip_side1 = createMarker ["marker_roadtrip_side1", [23146.244,19963.342]]; "marker_roadtrip_side1" setMarkerType "Empty";

_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_roadtrip_side1", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [5, 10, 136.181, true, 6];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "['task_roadtrip_side1', 'SUCCEEDED'] call BIS_fnc_taskSetState;", ""];

[WEST,["task_roadtrip_side1","task_fob_roadtrip"],["Une recrue des unités de reconnaissance a effectué une mission d'entrainement en solitaire il y a peu dans la région de Roadtrip. Initialement déployé en quad, il est bien ennuyé car il ne se souvient pas où il l'a caché... Ne voulant pas être blâmé par ses supérieurs, il a discrètement fait appel à vous afin de lui ramener son quad. Il se souvient seulement l'avoir laissé dans les environs de Ioannina, dans la végétation. Trouvez le quad et cachez-le dans le <marker name='marker_roadtrip_side1'>grand hangar en métal</marker> à Ioannina, il viendra le récupérer discrètement plus tard.", "Eclaireur distrait", ""],getArray(configFile >> "CfgWorlds" >> worldName >> "Names" >> "Ioannina" >> "position"),true,1,true,"scout"] call BIS_fnc_taskCreate;


waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;
deleteMarker "marker_roadtrip_side1";