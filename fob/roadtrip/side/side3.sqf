// ------ Side archéologie -----
// Author : [LM]Cheitan
// Team   : La Muerta

_marker_roadtrip_side3 = createMarker ["marker_roadtrip_side3", [27881.8,24036.3]];
"marker_roadtrip_side3" setMarkerShape "ellipse";
"marker_roadtrip_side3" setMarkerSize [150,150];
"marker_roadtrip_side3" setMarkerBrush "Horizontal";
"marker_roadtrip_side3" setMarkerAlpha 0.5;
"marker_roadtrip_side3" setMarkerColor "ColorOrange";

[WEST,["task_roadtrip_side3","task_fob_roadtrip"],["Des plongeurs amateurs ont aidé à faire un relevé de l'état des côtes. Un groupe au nord-est de l'île a signalé un <marker name='marker_roadtrip_side3'>banc de sable en cours d'érosion</marker> à cause d'un courant marin saisonnier. Dans le creux formé, ils ont aperçu des objets qu'ils identifient comme des ruines antiques. Si cela se révèle exact, le gouvernement de la République d'Altis et Stratis serait en droit de demander de nouvelles aides aux Nations-Unies, afin de protéger ce site archéologique. Le gouvernement a demandé à notre commandement d'effectuer un relevé un peu plus précis. Cela n'entre normalement pas dans nos attributions, mais le commandement a discrètement laissé entendre que si jamais des ruines antiques étaient découvertes au détour d'un entrainement de plongée, alors les lois en vigueur l'obligerait à prendre des mesures allant dans le sens du gouvernement. Ca tombe bien, on vient juste d'apprendre que les exercices de plongée se dérouleront désormais dans un secteur tout proche du lieu concerné. Le hasard fait bien les choses, pas vrai ?", "Exercice de plongée","marker_roadtrip_side3"],getMarkerPos "marker_roadtrip_side3",true,1,true,"boat"] call BIS_fnc_taskCreate;


_site1 = [
	["Land_Statue_01_F",[27926.4,24120.6,-2.0587],270],
	["Land_Mound02_8m_F",[27927.3,24116.7,-0.0660877],0],
	["Land_Mound02_8m_F",[27923.6,24121.6,-0.170534],90],
	["Land_Fortress_01_bricks_v2_F",[27935.4,24117.3,-0.276903],0],
	["Land_Fortress_01_bricks_v1_F",[27938.6,24120.3,-0.615023],0]
];

_site2 = [
	["Land_AncientPillar_F",[27971.2,24109.3,-9.40232],0],
	["Land_Stone_pillar_F",[27966.4,24108.3,-1.7829],0],
	["Land_AncientPillar_fallen_F",[27974.5,24113.5,-1.09067],190],
	["Land_AncientPillar_fallen_F",[27972.1,24105.1,-0.987808],0]
];

_site3 = [
	["Land_AncientPillar_fallen_F",[27985.3,24139.3,-1.08024],0],
	["Land_GardenPavement_02_F",[27988.5,24136.4,-0.0787945],0],
	["Land_GardenPavement_02_F",[27988.2,24131.3,-0.0309391],0],
	["Land_GardenPavement_02_F",[27988.1,24127.7,0.051796],0],
	["Land_Ancient_Wall_8m_F",[27981.9,24131.2,-0.870344],270],
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

// Compteur de découvertes
_total = 0;
LM_COMMANDER setVariable ["roadtrip_side3", 0, false]; // Variable du commandant afin que les triggers y ait accès

{
	if(count _x > 0) then {
		_liste = _x;

		// Spawn des objets de ce site
		{
			_obj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
			_obj enableSimulation false;
			_obj setPosATL (_x select 1);
			_obj setDir (_x select 2);
			(LM_MISSION_FOB_TEMP select 2) pushBack _obj;
		} forEach _liste;

		// Ajout d'un site au nombre total de sites à découvrir
		_total = _total + 1;

		// Ajout du trigger de découverte
		_pos = ((_x select 0) select 1); //position du premier objet de chaque site
		_trigger = createTrigger ["EmptyDetector", _pos, false];
		_trigger setPosATL _pos;
		_trigger setTriggerArea [5, 5, 0, false, 5]; //sphère de 5m de rayon
		_trigger setTriggerActivation ["WEST", "PRESENT", false];
		_trigger setTriggerStatements ["this", "
			LM_COMMANDER setVariable ['roadtrip_side3', (LM_COMMANDER getVariable 'roadtrip_side3')+1];
			deleteVehicle thisTrigger;
		", ""];
	};
} forEach [_obli, _second, _impro];

waitUntil { sleep 2; (LM_COMMANDER getVariable "roadtrip_side3") == _total };
deleteMarker _marker_roadtrip_side3;
["task_roadtrip_side3", "SUCCEEDED"] call BIS_fnc_taskSetState;
LM_COMMANDER setVariable ["roadtrip_side3", nil];