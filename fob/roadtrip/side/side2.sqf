// ------ Side satellite -----
// Author : [LM]Cheitan
// Team   : La Muerta

_objets = ["Land_WaterBottle_01_cap_F","Land_TorqueWrench_01_F","Land_BoreSighter_01_F","Land_TinContainer_F","Land_Sleeping_bag_folded_F","Land_FoodContainer_01_F"];

_marker_roadtrip_side2 = createMarker ["marker_roadtrip_side2", [26293.1,25941.1]];
"marker_roadtrip_side2" setMarkerShape "ellipse";
"marker_roadtrip_side2" setMarkerSize [2500,700];
"marker_roadtrip_side2" setMarkerDir 200;
"marker_roadtrip_side2" setMarkerBrush "Horizontal";
"marker_roadtrip_side2" setMarkerAlpha 0.5;
"marker_roadtrip_side2" setMarkerColor "ColorOrange";

_centre = [27940.6,25293.7,0];

{
	//Créer l'objet
	_v = createVehicle [_x, [0,0,0], [], 0, "NONE"];
	//Position aléatoire
	_v setPosATL (_centre getPos [floor(random 400), floor(random 360)]);
	//Création de marker dessus
	_m = createMarker [format["mark_%1", _x], getPos _v];
	_m setMarkerType "mil_triangle";
	_m setMarkerColor "ColorRed";
	//Action ACE de ramassage
	_statement = {
		params ["_target", "_player", "_params"];
		deleteMarker format["mark_%1", typeOf _target];
		if(typeOf _target isEqualTo "Land_FoodContainer_01_F") then {['task_roadtrip_side2', 'SUCCEEDED'] call BIS_fnc_taskSetState};
		deleteVehicle _target;
	};
	[_v,0,["ACE_MainActions"],format["take_%",_forEachIndex],"Ramasser","",_statement,{true}] call LM_fnc_createAceActionGlobal;
	//Ajout à la suppression, au cas où
	(LM_MISSION_FOB_TEMP select 2) pushBack _v;
} forEach _objets;

[WEST,["task_roadtrip_side2","task_fob_roadtrip"],["Suite à une erreur humaine, un satellite de notre flotte d'observation a raclé l'atmosphère d'un peu trop près. Bien évidemment, la majeure partie de l'engin s'est désintégré durant la chute, mais certaines pièces légères ou spécialement conçues ont pu parvenir jusqu'au sol. En particulier, l'ordinateur central de l'appareil devrait avoir survécu à la descente, protégé par un caisson spécial. Il nous serait utile de retrouver ce caisson afin de comprendre pourquoi la manoeuvre effectuée a désorbité l'appareil. Nous avons suivi durant la chute quelques gros débris. La majeure partie d'entre eux s'est écrasée en mer, mais certains ont touché l'île, et sont marqués sur votre carte. Avec un peu de chance, le caisson sera l'un d'entre eux. Trouvez-le, et ramassez aussi les autres débris si vous en avez le temps.", "Désorbitage imprévu","marker_roadtrip_side2"],_centre,true,1,true,"search"] call BIS_fnc_taskCreate;

waitUntil { sleep 2; ("task_roadtrip_side2" call BIS_fnc_taskState) isEqualTo "SUCCEEDED" };
deleteMarker _marker_roadtrip_side2;