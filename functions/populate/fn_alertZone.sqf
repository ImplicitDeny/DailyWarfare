//exec: server


if(LM_MISSION_POPULATE select 6) then { playSound3D[MISSION_ROOT + "sounds\sirene_alerte.ogg", objNull, false, LM_MISSION_POSITION, 12]; };

// Alerte générale
{
	if(side _x isEqualTo east) then
	{
		if!(isNil {_x getVariable "LM_MISSION_WANDER"}) then {
			deleteWaypoint [_x, 0];
			_wp = _x addWaypoint [getPos (nearestObjects [getPos leader _x, ["Sign_Pointer_Green_F"], 500, true] select 0), 0];
			_wp setWaypointType "HOLD";
		};
		_x setBehaviour "COMBAT";
		_x setCombatMode "RED";
	};
} forEach allGroups;

// Gorgon
_grp = [];
{ _grp pushBackUnique group _x } forEach (LM_MISSION_POSITION nearEntities ["KICC_HOMME_EQUIPAGE", 1000]);
{
	_v = _x getVariable "lm_assigned_vehicle";
	if!(_v isEqualTo objNull) then
	{
		_wp = _x addWaypoint [getPos _v, 0];
		_wp waypointAttachVehicle _v;
		_wp setWaypointType "GETIN";
		_wp = _x addWaypoint [LM_MISSION_POSITION, 100];
		_wp setWaypointType "MOVE";	
		_wp setWaypointStatements ["true", "[group this, getPos this] call BIS_fnc_taskDefend"];
	};
} forEach _grp;

// Ifrits et Offroads
_veh = LM_MISSION_POSITION nearEntities [["KICC_OFFROAD_ARMED", "KICC_IFRIT_HMG"], 1000];
{
	_g = _x getVariable "lm_assigned_group";
	if!(_g isEqualTo grpNull) then
	{
		_wp = _g addWaypoint [getPos _x, 0];
		_wp waypointAttachVehicle _x;
		_wp setWaypointType "GETIN";
		_wp = _g addWaypoint [LM_MISSION_POSITION, 200];
		_wp setWaypointType "MOVE";	
		_wp setWaypointStatements ["true", "[group this, getPos this, 200] call BIS_fnc_taskDefend"];
	};
} forEach _veh;