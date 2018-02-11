params ["_group"];
{
	[_x] call LM_fnc_addInjurableUnit;
} forEach (units _group);