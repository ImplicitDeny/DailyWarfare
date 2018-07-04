// ------ Base militaire baie de Pefkas -----
// Author : [LM]Cheitan
// Team   : La Muerta

//----------Initialisation de l'environnement----------
marker_pefkas1 = createMarker ["marker_pefkas1", [20944.5,19252.7,0]]; "marker_pefkas1" setMarkerType "Empty";
[WEST,["task_pefkas1_main"],["De longue date, la <marker name='marker_pefkas1'>base militaire de la baie de Pefkas</marker> est occupée par le KICC. Le commandement a décidé d'y mettre un terme, afin d'accroître notre contrôle sur la région. L'objectif est simple : réduire cette base au silence. Pour ce faire, réalisez tous les objectifs ci-dessous. Plus vous réaliserez d'objectifs, plus l'ennemi perdra pied et sera enclin à fuir ou se rendre.", "Opération Jackhammer", "marker_pefkas1"],objNull,true,1,true, "attack"] call BIS_fnc_taskCreate;
LM_MISSION_MAIN_TASK = "task_pefkas1_main";
LM_MISSION_POSITION = getMarkerPos "marker_pefkas1";

//Initialisation du tableau de suppression
_mission_object_array = [];
_mission_unit_array = [];


// Antiaérien
_emp = [
	[[20848.5,19243.5,0],298],
	[[20834.9,19193.2,0],245],
	[[20885.6,19172.2,0],200]
];
{
	_v = ["EAST", "KICC_TIGRIS", (_x select 0), (_x select 1)] call LM_fnc_createVehicle;
	_v forceSpeed 0;
	_mission_object_array pushBack _v;
} forEach _emp;
[WEST,["task_pefkas_aa","task_pefkas1_main"],["Détruisez les moyens antiaériens à l'ouest de la base.", "Batterie AA", ""],[20834.9,19193.2,0],false,1,false,"destroy"] call BIS_fnc_taskCreate;

// Artillerie
_emp = [
	[21047,19243.5,0],
	[21047.2,19224.5,0],
	[21047.1,19206.5,0]
];
{
	_v = "KICC_SOCHOR" createVehicle _x;
	_v setDir 90;
	_v lock true;
	_mission_object_array pushBack _v;
} forEach _emp;
[WEST,["task_pefkas_lr","task_pefkas1_main"],["Détruisez la batterie d'artillerie à l'est de la base.", "Batterie 155mm", ""],[21047.2,19224.5,0],false,1,false,"destroy"] call BIS_fnc_taskCreate;

// Mortiers
_emp = [
	[[20906,19346.4,0],35],
	[[20912.9,19349.6,0],173],
	[[20922.2,19349.3,0],266]
];
{
	_b = "Land_BagFence_Round_F" createVehicle (_x select 0);
	_b setDir (_x select 1);
	_m = "O_Mortar_01_F" createVehicle (_b getRelPos [1, 0]);
	_m setDir ((_x select 1) + 180);
	_mission_object_array pushBack _b;
	_mission_object_array pushBack _m;
} forEach _emp;
[WEST,["task_pefkas_sr","task_pefkas1_main"],["Capturez la batterie de mortiers au nord de la base.", "Batterie 82mm", ""],[20912.9,19349.6,0],false,1,false,"interact"] call BIS_fnc_taskCreate;

// Recherches
_filets = [[[20902.8,19231.3,0],0.000454269],[[20893.3,19236,0],344.28],[[20894.9,19236.8,0],327.749],[[20893.4,19237.8,0],65.6544]];
_bidons = [[[20895.6,19227.3,0.5],359.998],[[20895.7,19228.3,0.5],359.998],[[20894.9,19228.1,0.5],359.998],[[20901.7,19232.6,0.5],359.998]];
{
	_f = createVehicle ["CargoNet_01_barrels_F", (_x select 0), [], 0, "CAN_COLLIDE"];
	_f setDir (_x select 1);
	_mission_object_array pushBack _f;
} forEach _filets;
{
	_b = createVehicle ["Land_MetalBarrel_F", (_x select 0), [], 0, "CAN_COLLIDE"];
	_b setPosATL (_x select 0);
	_b setDir (_x select 1);
	_mission_object_array pushBack _b;
} forEach _bidons;
_deco = [["Land_Notepad_F",[20893.7,19227.9,1.41428],359.978],["Land_CampingTable_small_F",[20893.8,19228.1,0.603271],243.484],["Land_FilePhotos_F",[20893.5,19228.3,1.41428],80.2825],["Land_OfficeChair_01_F",[20890.8,19225.1,0.60067],125.383],["OfficeTable_01_new_F",[20889.8,19224.8,0.600668],241.956],["Land_PenBlack_F",[20893.6,19228.1,1.41427],359.997],["Land_MapBoard_01_Wall_Altis_F",[20889.5,19224.6,1.823],241.967],["Land_MapBoard_F",[20890.2,19231,0.59845],290.08]]
{
	_d = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	_d enableSimulation false;
	_d setDir (_x select 2);
	_mission_object_array pushBack _d;
} forEach _deco;
//objectif : ["Land_File1_F",[20893.7,19228.1,1.41428],38.1935]
[WEST,["task_pefkas_rs","task_pefkas1_main"],["Trouvez la formule du carburant amélioré expérimenté par le KICC sur Altis.", "Recherches", ""],[20894.9,19228.1,0.5],false,1,false,"search"] call BIS_fnc_taskCreate;

//----------Boucle principale----------
waitUntil
{
	sleep 5;
	_fin = true;
	{
		_state = [_x] call BIS_fnc_taskState;
		if( !(_state in ["SUCCEEDED","CANCELED"]) ) exitWith { _fin = false }
	} forEach "task_pefkas1_main" call BIS_fnc_taskChildren;
	_fin
};

//----------Suppression de l'environnement----------
{LM_MISSION_TEMP pushBack _x}forEach _mission_object_array;
{LM_MISSION_TEMP pushBack _x}forEach _mission_unit_array;
{LM_MISSION_TEMP pushBack _x}forEach _box_array;
deleteMarker "marker_pefkas1";
["task_pefkas1_main", "SUCCEEDED", true] spawn BIS_fnc_taskSetState;
// ... end of mission's code, do not edit any of the lines bellow.