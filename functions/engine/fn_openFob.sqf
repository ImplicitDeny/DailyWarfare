//exec: server

params["_fob"];

// Changement du status visible
_task = switch(_fob) do
{
	case 0: { "task_fob_greenvalley" };
	case 1: { "task_fob_highwatch" };
	case 2: { "task_fob_roadtrip" };
	case 3: { "task_fob_southblues" };
};

// TODO : utilisation de ces trois lignes-là lors de l'implémentation du système de construction. En attendant, activation directe, instantanée
// _current = [_task] call BIS_fnc_taskDescription;
// [_task,"use"] call BIS_fnc_taskSetType;
// [_task, ["Etat : OUVERT<br/><br/>La région est sécurisée. Rendez-vous au FOB et utilisez l'action ACE sur le drapeau pour activer le FOB.", (_current select 1), (_current select 2)]] spawn BIS_fnc_taskSetDescription;

// Lancement du scénario de construction
_scenario = switch(_fob) do
{
	case 0: { "fob\greenvalley\build.sqf" };
	case 1: { "fob\highwatch\build.sqf" };
	case 2: { "fob\roadtrip\build.sqf" };
	case 3: { "fob\southblues\build.sqf" };
};
_handle = execVM _scenario;