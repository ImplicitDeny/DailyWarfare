// ------ Construction FOB GreenValley -----
// Author : [LM]Cheitan
// Team   : La Muerta

// Objets intérieur
_pos = [9763.348633,12548.698242,-0.00571632];
_object = createVehicle ["Land_Cargo_House_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 62.2619;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;

sleep 3;

_pos = [9764.984375,12539.613281,0.0104008];
_object = createVehicle ["Land_Cargo_House_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 96.623;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;

sleep 3;

_pos = [9723.339844,12534.759766,-0.200156];
_object = createVehicle ["Land_Cargo_House_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 313.283;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;

sleep 3;

_pos = [9729.845703,12541.514648,-0.0212574];
_object = createVehicle ["Land_Cargo_House_V1_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 313.283;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;

sleep 3;

_pos = [9730.00390625,12560.512695,-9.53674e-007];
_object = createVehicle ["Land_Scaffolding_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 135.145;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;