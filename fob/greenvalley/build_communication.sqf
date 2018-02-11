// ------ Construction FOB GreenValley -----
// Author : [LM]Cheitan
// Team   : La Muerta

_pos = [9760.620117,12554.750977,-0.000761032];
_object = createVehicle ["Land_Communication_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir 316.064;
_object setPosATL _pos; (LM_MISSION_FOB_TEMP select 0) pushBack _object;
_object enableSimulation false;
