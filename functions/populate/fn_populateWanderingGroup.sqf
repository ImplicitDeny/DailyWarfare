//exec: server

params["_center"];

_count = 0;
_position = [(_center select 0) + random (200) - random (200), (_center select 1) + random (200) - random (200), 0];
if!(surfaceIsWater _position) then
{
	switch(floor random 2) do
	{
		case 0: {
			// groupe errant
			_group = [_position, east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;
			_group deleteGroupWhenEmpty true;
			_group setVariable ["LM_MISSION_WANDER", true]; //utile pour l'alerte générale
			[_group] call LM_fnc_addInjurableGroup;
			{LM_MISSION_TEMP pushback _x}forEach (units _group);
			_count = _count + count units _group;
			_wp = _group addWaypoint [_position, 0];
			_wp setWaypointType "DISMISS";
			_wp setWaypointBehaviour "SAFE";
		};
		case 1: {
			// groupe avec un truc à garder
			_target = nearestObject [_position, selectRandom ["Land_Crane_F", "Land_fs_roof_F", "Land_Offices_01_V1_F", "Kand_Kiosk_papers_F", "Land_Communication_F", "Land_TTowerBig_1_F", "Land_TTowerBig_2_F"]];
			if(_position distance _target < 1000) then
			{
				createGuardedPoint [east, [0,0], -1, _target];
				_group = [_position, east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "sentinelle")] call BIS_fnc_spawnGroup;
				_group deleteGroupWhenEmpty true;
				[_group] call LM_fnc_addInjurableGroup;
				{LM_MISSION_TEMP pushback _x}forEach (units _group);
				_count = _count + count units _group;
				_wp = _group addWaypoint [_target, 0];
				_wp setWaypointType "GUARD";
				_wp setWaypointBehaviour "SAFE";
			};
		};
	};
};

_count