/*
	File: fn_objectCreation.sqf

	Description:
	To create an object of the given classname at the given position with the given direction and the given vertical axis.
	You can also choose if you want the object simulation to be activated.

	Parameter(s):
	_this select 0: classname (String)
	_this select 1: position (Array)
	_this select 2: direction (Number)
	_this select 3: normal to surface (String: SURFACE_NORMAL)
	_this select 4: enableSimulation (Boolean)
	
	Returns:
	_object - the object created
	
*/

params["_classname","_position","_direction","_vertical_axis","_simulation"];

_object = objNull;

_object = createVehicle [_classname,_position, [], 0, "CAN_COLLIDE"];
_object setPosATL _position;
_object setdir _direction;

if(_vertical_axis == "SURFACE_NORMAL") then {

	_object setVectorUp (surfacenormal (getPosATL _object))
	
} else {

	_object setVectorUp [0,0,1]
	
};

if(_simulation) then {
	
	_object enableSimulation true

} else {

	_object enableSimulation false

};

_object