//exec: server

params["_center", "_helipads"];

if(!_helipads) exitWith {};

_helis = []; // Tableau de tous les groupes de pilotes créés

{
	_veh = ["KICC_KAJMAN", "KICC_ORCA_ARMED"];
	_v = objNull;
	if(random 1 > 0.1) then {
		_v = createVehicle [(selectRandom _veh), [0,0,1000], [], 0, "NONE"];
		_v setDir (getDir _x);
		_pos = getPos _x findEmptyPosition [0,4, typeOf _v];
		if!(_pos isEqualTo []) then {
			_group = [getPos _x, east, ["KICC_PILOTE_HELI", "KICC_COPILOTE_HELI"]] call BIS_fnc_spawnGroup;
			_group deleteGroupWhenEmpty true; [_group] call LM_fnc_addInjurableGroup; {LM_MISSION_TEMP pushback _x} forEach (units _group);
			_group addVehicle _v;
			_v setVariable ["LM_assigned_group", _group];
			_v setPosATL getPos _x; LM_MISSION_TEMP pushBack _v; _helis pushBack _v;
		} else { deleteVehicle _v; };
	};
} forEach (_center nearObjects ["Helipad_Base_F", 1000]);

_helis