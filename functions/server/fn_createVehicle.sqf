/*
	File: fn_createVehicle.sqf

	Description:
	To create a vehicle and its crew with a given side, a given classname, a given position and a given direction.

	Parameter(s):
	_this select 0: side (EAST,WEST...)
	_this select 1: classname (String)
	_this select 2: position (Array)
	_this select 3: direction (Number)
	
	Returns:
	_vehicle - the created vehicle
	
*/

params["_side","_type","_position","_direction"];

_group = createGroup _side;
_group deleteGroupWhenEmpty true;

_vehicle = _type createVehicle _position;
_vehicle setPosATL _position;
_vehicle setDir _direction;
_vehicle setVectorUp (surfacenormal (getPosATL _vehicle));

createVehicleCrew _vehicle;
(crew _vehicle) join _group;

_vehicle