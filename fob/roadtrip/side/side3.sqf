// ------ Side archéologie -----
// Author : [LM]Cheitan
// Team   : La Muerta

_site1 = [
	["Land_Mound02_8m_F",[27927.3,24116.7,-0.0660877],0],
	["Land_Mound02_8m_F",[27923.6,24121.6,-0.170534],90],
	["Land_Statue_01_F",[27926.4,24120.6,-2.0587],270],
	["Land_Fortress_01_bricks_v2_F",[27935.4,24117.3,-0.276903],0],
	["Land_Fortress_01_bricks_v1_F",[27938.6,24120.3,-0.615023],0]
];

_site2 = [
	["Land_Stone_pillar_F",[27966.4,24108.3,-1.7829],0],
	["Land_AncientPillar_fallen_F",[27974.5,24113.5,-1.09067],190.337],
	["Land_AncientPillar_fallen_F",[27972.1,24105.1,-0.987808],0],
	["Land_AncientPillar_F",[27971.2,24109.3,-9.40232],0]
];

_site3 = [
	["Land_GardenPavement_02_F",[27988.5,24136.4,-0.0787945],0],
	["Land_GardenPavement_02_F",[27988.2,24131.3,-0.0309391],0],
	["Land_GardenPavement_02_F",[27988.1,24127.7,0.051796],0],
	["Land_Ancient_Wall_8m_F",[27981.9,24131.2,-0.870344],270],
	["Land_AncientPillar_fallen_F",[27985.3,24139.3,-1.08024],0],
	["Land_AncientPillar_damaged_F",[27990.1,24139.2,-4.70786],0]
];

_sites = [_site1, _site2, _site3];
_obli = [];
_second = [];
_impro = [];

// Site obligatoire
_obli = selectRandom _sites;
_sites = _sites - _obli;

// Site secondaire
if(random 1 < 0.6) then {
	_second = selectRandom _sites;
	_sites = _sites - _second;
};

// Site improbable
if(random 1 < 0.2) then {
	_impro = selectRandom _sites;
	_sites = _sites - _impro;
};

{
	// Vérif si pas vide, et création
} forEach [_obli, _second, _impro];





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
	_vehicle = createVehicle [_x, [0,0,0], [], 0, "NONE"];
	//Position aléatoire
	_vehicle setPosATL (_centre getPos [floor(random 400), floor(random 360)]);
	//Création de marker dessus
	_marker = createMarker [format["mark_%1", _x], getPos _vehicle];
	_marker setMarkerType "mil_triangle";
	_marker setMarkerColor "ColorRed";
	//Action ACE de ramassage
	_statement = {
		params ["_target", "_player", "_params"];
		deleteMarker format["mark_%1", typeOf _target];
		if(typeOf _target isEqualTo "Land_FoodContainer_01_F") then {['task_roadtrip_side2', 'SUCCEEDED'] call BIS_fnc_taskSetState};
		deleteVehicle _target;
	};
	[_vehicle,0,["ACE_MainActions"],format["take_%",_forEachIndex],"Ramasser","",_statement,{true}] call LM_fnc_createAceActionGlobal;
	//Ajout à la suppression, au cas où
	(LM_MISSION_FOB_TEMP select 2) pushBack _vehicle;
} forEach _objets;

[WEST,["task_roadtrip_side2","task_fob_roadtrip"],["Suite à une erreur humaine, un satellite de notre flotte d'observation a raclé l'atmosphère d'un peu trop près. Bien évidemment, la majeure partie de l'engin s'est désintégré durant la chute, mais certaines pièces légères ou spécialement conçues ont pu parvenir jusqu'au sol. En particulier, l'ordinateur central de l'appareil devrait avoir survécu à la descente, protégé par un caisson spécial. Il nous serait utile de retrouver ce caisson afin de comprendre pourquoi la manoeuvre effectuée a désorbité l'appareil. Nous avons suivi durant la chute quelques gros débris. La majeure partie d'entre eux s'est écrasée en mer, mais certains ont touché l'île, et sont marqués sur votre carte. Avec un peu de chance, le caisson sera l'un d'entre eux. Trouvez-le, et ramassez aussi les autres débris si vous en avez le temps.", "Désorbitage imprévu","marker_roadtrip_side2"],_centre,true,1,true,"search"] call BIS_fnc_taskCreate;

waitUntil { sleep 2; ("task_roadtrip_side2" call BIS_fnc_taskState) isEqualTo "SUCCEEDED" };
deleteMarker _marker_roadtrip_side2;