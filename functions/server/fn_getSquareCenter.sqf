/*
	File: fn_getSquareCenter.sqf

	Description:
	To have position of the center of square zones on the map.

	Parameter(s):
	_this select 0: square (ARRAY - square coordinates [x,y], only thousands ans hundreds as "[05,12]" which means "[500,1200]")
	
	Returns:
	_center - position 2D format
	
*/

params["_square"];

_center = [];
_squareX = (_square select 0)*1000 + 500;
_squareY = (_square select 1)*1000 + 500;
_center pushBack _squareX;
_center pushBack _squareY;

_center