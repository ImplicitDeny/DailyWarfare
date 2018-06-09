//exec: server

params["_center", "_patrols"];

_count = 0;

if(!_patrols) exitWith {_count};

// Patrouilles dans la ville
for "_i" from 0 to 3 do
{
	_position = [(_center select 0) + random (200) - random (200) , (_center select 1) + random (200) - random (200) , 0];
	_group = [_position, east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "sentinelle")] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	[_group] call LM_fnc_addInjurableGroup;
	{LM_MISSION_TEMP pushback _x}forEach (units _group);
	_count = _count + count units _group;
	[_group, _center, 200] call BIS_fnc_taskPatrol;
};

// Patrouilles hors zone
for "_i" from 0 to 2 do
{
	_posX = (_center select 0) + random (1000) - random (1000);
	_posY = (_center select 1) + random (1000) - random (1000);
	_pos = [_posX, _posY];
	{ if(_x > (_center select _forEachIndex)) then { _pos set [_forEachIndex, _x + 1000] } else { _pos set [_forEachIndex, _x - 1000] }; } forEach _pos;
	_position = [(_pos select 0), (_pos select 1), 0];
	if!(surfaceIsWater _position) then
	{
		_group = [_position, east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;
		_group deleteGroupWhenEmpty true;
		[_group] call LM_fnc_addInjurableGroup;
		{LM_MISSION_TEMP pushback _x}forEach (units _group);
		_count = _count + count units _group;
		[_group, _position, 1000] call BIS_fnc_taskPatrol;
	};
};

_count