//exec: server

params["_helis"];

{
	_group = _x getVariable "LM_assigned_group";
	_wp = _group addWaypoint [getPos _x, 0];
	_wp waypointAttachVehicle _x;
	_wp setWaypointType "GETIN";
	_wp = _group addWaypoint [LM_MISSION_POSITION, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
} forEach _helis;