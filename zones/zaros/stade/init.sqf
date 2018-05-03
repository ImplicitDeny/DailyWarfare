params["_mode"];

if(_mode == "CONQUETE") then {
	_pos = [9232.915039,11976.245117,-0.0156918];
	_sochor1 = createVehicle ["KICC_SOCHOR", _pos, [], 0, "CAN_COLLIDE"];
	_sochor1 setDir 15.7968;
	_sochor1 setPosATL _pos;

	_pos = [9235.395508,11974.542969,0.0146866];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.766;
	_object setPosATL _pos;

	_pos = [9233.704102,11978.878906,0.0308657];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 196.032;
	_object setPosATL _pos;

	_pos = [9230.0556641,11976.0810547,0.069931];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.772;
	_object setPosATL _pos;

	_pos = [9232.49,11977.3,0];
	_object = createVehicle ["CamoNet_INDP_big_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.063;
	_object setPosATL _pos;

	_pos = [9252.107422,11970.710938,-0.0228558];
	_sochor2 = createVehicle ["KICC_SOCHOR", _pos, [], 0, "CAN_COLLIDE"];
	_sochor2 setDir 15.796;
	_sochor2 setPosATL _pos;

	_pos = [9249.260742,11970.552734,0.0103292];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.769;
	_object setPosATL _pos;

	_pos = [9252.90918,11973.350586,0.00279427];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 196.032;
	_object setPosATL _pos;

	_pos = [9254.600586,11969.0146484,0.00211143];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.768;
	_object setPosATL _pos;

	_pos = [9247.694336,11966.516602,1.62125e-005];
	_object = createVehicle ["CargoNet_01_box_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 359.993;
	_object setPosATL _pos;

	_pos = [9271.551758,11964.745117,-0.0226126];
	_sochor3 = createVehicle ["KICC_SOCHOR", _pos, [], 0, "CAN_COLLIDE"];
	_sochor3 setDir 15.7979;
	_sochor3 setPosATL _pos;

	_pos = [9268.707031,11964.581055,0.0101709];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.769;
	_object setPosATL _pos;

	_pos = [9272.355469,11967.378906,-0.0184917];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 196.031;
	_object setPosATL _pos;

	_pos = [9274.046875,11963.0429688,0.0117655];
	_object = createVehicle ["Land_HBarrier_5_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 286.77;
	_object setPosATL _pos;

	_pos = [9272.05,11966.2,0];
	_object = createVehicle ["CamoNet_INDP_big_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 16.205;
	_object setPosATL _pos;

	_pos = [9235.794922,11959.166016,-0.210176];
	_object = createVehicle ["KICC_TEMPEST_AMMO", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 153.301;
	_object setPosATL _pos;

	_pos = [9256.439453,11949.148438,-0.0414772];
	_object = createVehicle ["KICC_OFFROAD_UNARMED", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 267.821;
	_object setPosATL _pos;

	_pos = [9272.238281,11938.15918,0];
	_object = createVehicle ["Land_BagBunker_Tower_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 196.403;
	_object setPosATL _pos;

	_pos = [9268.0703125,11939.957031,-6.48499e-005];
	_object = createVehicle ["Land_BagFence_Long_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 21.0662;
	_object setPosATL _pos;

	_pos = [9267.889648,11937.401367,2.95639e-005];
	_object = createVehicle ["Land_BagFence_Short_F", _pos, [], 0, "CAN_COLLIDE"];
	_object setDir 14.8842;
	_object setPosATL _pos;

	[WEST,["task_zaros_stade","task_zaros_main"],["Plusieurs pièces d'artillerie sont présentes au stade de Zaros. Détruisez ces véhicules afin qu'ils ne soient pas repris par l'ennemi.", "Artillerie lourde", "marker_zaros"],[9246.25,11959.1,0],true,1,false,"destroy"] call BIS_fnc_taskCreate;
	waitUntil { !alive _sochor1 && !alive _sochor2 && !alive _sochor3 };
	["task_zaros_stade", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;
};
