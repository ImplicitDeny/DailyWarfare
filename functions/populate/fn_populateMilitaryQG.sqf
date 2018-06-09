//exec: server

params["_center", "_military"];

_count = 0;

if(!_military) exitWith {_count};

_array = (_center nearObjects ["Cargo_HQ_base_F", 1000]);

{
	_group = createGroup [east, true];
	_units = ["KICC_FUSILIER", "KICC_FUSILIER_AUTO", "KICC_FUSILIER_AC", "KICC_GRENADIER", "KICC_MEDIC"];
	for "_i" from 0 to count(_x buildingPos -1) do
	{
		if(random 1 > 0.5) then {
			_u = _group createUnit [(selectRandom _units), (_x buildingPos _i), [], 0, "CAN_COLLIDE"];
			LM_MISSION_TEMP pushBack _u;
		};
	};
	{doStop _x;} forEach units _group;
	_count = _count + count units _group;
	[_group] call LM_fnc_addInjurableGroup;
	
	// Marker d'alerte
	_object = createVehicle ["Sign_Pointer_Green_F", getPos _x, [], 0, "CAN_COLLIDE"];
	_object enableSimulation false;
	hideObjectGlobal _object;
	LM_MISSION_TEMP pushBack _object;

} forEach _array;

_count