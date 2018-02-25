
_pos = [9222.328125,12101.870117,0.00185013];
zaros_station_explosion = createVehicle ["StorageBladder_01_fuel_forest_F", _pos, [], 0, "CAN_COLLIDE"];
zaros_station_explosion setDir 57.9892;
zaros_station_explosion setPosATL _pos;

zaros_station_explosion addEventHandler ["Hit", {
	if(damage zaros_station_explosion > 0.2) then {
		[zaros_station_explosion] execVM 'AL_napalm\alias_obj_sing.sqf';
		zaros_station_explosion removeEventHandler ['Hit', 0]; };
}];