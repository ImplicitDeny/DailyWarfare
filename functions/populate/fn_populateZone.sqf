//exec: server

// Marker d'alerte principal, il y en a toujours au moins un de créé
_object = createVehicle ["Sign_Pointer_Green_F", LM_MISSION_POSITION, [], 0, "CAN_COLLIDE"];
_object enableSimulation false;
hideObjectGlobal _object;
LM_MISSION_TEMP pushBack _object;
	
_miliTow = ([LM_MISSION_POSITION, LM_MISSION_POPULATE select 0] call LM_fnc_populateMilitaryTowers);
_miliQG = ([LM_MISSION_POSITION, LM_MISSION_POPULATE select 0] call LM_fnc_populateMilitaryQG);
_miliWatch = ([LM_MISSION_POSITION, LM_MISSION_POPULATE select 0] call LM_fnc_populateMilitaryWatchTowers);
_sheds = ([LM_MISSION_POSITION, LM_MISSION_POPULATE select 1] call LM_fnc_populateSheds);
// helis = [LM_MISSION_POSITION, LM_MISSION_POPULATE select 2] call LM_fnc_populateHelipads;
_solar = ([LM_MISSION_POSITION, LM_MISSION_POPULATE select 3] call LM_fnc_populateSolarTowers);
_patrols = ([LM_MISSION_POSITION, LM_MISSION_POPULATE select 4] call LM_fnc_populatePatrols);

sleep 7;
_total = _miliQG + _miliTow + _miliWatch + _sheds + _solar + _patrols;

while { _total < (LM_MISSION_POPULATE select 5) } do
{
	_total = _total + ([LM_MISSION_POSITION] call LM_fnc_populateWanderingGroup);
};


_trigger = createTrigger ["EmptyDetector", LM_MISSION_POSITION, false];
_trigger setTriggerArea [1500, 1500, 0, false];
_trigger setTriggerActivation ["EAST", "WEST D", false];
_trigger setTriggerStatements ["this", "call LM_fnc_alertZone;", ""];

LM_MISSION_TEMP pushBack _trigger;