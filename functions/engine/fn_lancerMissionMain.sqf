//exec: server
//instance: unique

private ["_trouve", "_trouve_count", "_mission"];
_trouve = false;
_trouve_count = 0;

// --------------------------------------------- SELECTION DE LA MISSION ---------------------------------------------
while {!_trouve && _trouve_count < 1000} do
{
	_mission = selectRandom LM_MISSION_ZONES
	_trouve_count = _trouve_count + 1;
	if !(_mission in LM_MISSION_DONE) then { _trouve = true; };
};
if(_trouve_count == 1000) exitWith { ["Impossible de trouver une mission jouable"] call LM_fnc_showGlobalMissionError; };

[_mission] execVM "mission_engine.sqf";