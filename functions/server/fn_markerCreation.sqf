/*
	File: fn_markerCreation.sqf

	Description:
	To create a marker with a given name, a given position, a given color, a given shape and a given size.
	The size is the same for A and B axis.

	Parameter(s):
	_this select 0: marker name (String)
	_this select 1: position (Array)
	_this select 2: marker color (String)
	_this select 3: marker shape (String)
	_this select 4: size (Number)
	
	Returns:
	_marker - the marker created
	
*/

params["_name","_position","_color","_shape","_size"];

_marker = createMarker [_name, _position];
_marker setMarkerColor _color;
_marker setMarkerShape _shape;
_marker setMarkerSize [_size, _size];

_marker