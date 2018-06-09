// ------ Construction FOB GreenValley -----
// Author : [LM]Cheitan
// Team   : La Muerta

// Postes de mortier
_pos = [9755.158203,12525.274414,-0.112779];
_object = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 55.1995;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

_pos = [9755.158203,12525.274414,0.75];
_object = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 55.1995;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

_pos = [9756.931641,12526.595703,0.0370045];
_object = createVehicle ["LM_Mk6_mortar_base", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 194.892;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;

sleep 3;

_pos = [9760.96875,12527.967773,-0.120434];
_object = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 295.899;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

_pos = [9760.96875,12527.967773,0.75];
_object = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 295.899;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

_pos = [9758.982422,12528.879883,0.0369606];
_object = createVehicle ["LM_Mk6_mortar_base", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 75.0527;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

sleep 3;

_pos = [9755.767578,12531.317383,-0.184671];
_object = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 176.976;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

_pos = [9755.767578,12531.317383,0.75];
_object = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 176.976;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

_pos = [9755.947266,12529.165039,0.0369921];
_object = createVehicle ["LM_Mk6_mortar_base", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 315.553;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;

sleep 3;

_pos = [9753.277344,12596.888672,2.74653];
_object = createVehicle ["B_HMG_01_high_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 28.4901;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;

_pos = [9698.47168,12544.0839844,2.74335];
_object = createVehicle ["B_HMG_01_high_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 225.733;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
