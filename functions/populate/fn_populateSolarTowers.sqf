//exec: server

params["_center", "_solartowers"];

_count = 0;

if(!_solartowers) exitWith {_count};

{
	_units = ["KICC_SNIPER", "KICC_TIREUR_PRECISION"];
	if(random 1 > 0.5) then {
		_u = (createGroup [east, true]) createUnit [(selectRandom _units), (_x modelToWorld [0,0,24]), [], 0, "CAN_COLLIDE"];
		[_u] call LM_fnc_addInjurableUnit;
		LM_MISSION_TEMP pushBack _u;
		_count = _count + 1;
	};
} forEach (_center nearObjects ["Land_spp_Tower_F", 1000]);

_count