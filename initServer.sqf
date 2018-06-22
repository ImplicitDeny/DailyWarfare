//exec : server
_nul = "base\lights.sqf" remoteExec ["execVM", 0, true];
_nul = []execVM "base\template.sqf";

//Grille électrique - Détection des lampes en fonction des zones

_lights = ["Land_fs_roof_F","Land_LampShabby_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampSolar_F","Land_LampStadium_F","Land_LampStreet_F","Land_LampStreet_small_F","Land_LandMark_F","Land_PowerPoleWooden_L_F"];
_lights_numb = count(_lights);

_zone_list = [];
_agela_grid = ["agela",[8,6],[8,7],[8,8],[9,6],[9,7],[9,8],[9,9],[10,6],[10,7],[10,8],[10,9],[10,10],[11,6],[11,7],[11,8],[11,9],[11,10],[12,6],[12,7],[12,8],[12,9],[12,10],[13,6],[13,7],[14,6]];
_athira_grid = ["athira",[11,14],[11,15],[11,16],[11,17],[12,14],[12,15],[12,16],[12,17],[12,18],[12,19],[12,20],[12,21],[12,22],[12,23],[13,14],[13,15],[13,16],[13,17],[13,18],[13,19],[13,20],[13,21],[13,22],[13,23],[14,15],[14,16],[14,17],[14,18],[14,19],[14,20],[14,21],[14,22],[14,23],[15,15],[15,16],[15,17],[15,18],[15,19],[15,20],[15,21],[15,22],[16,14],[16,15],[16,16],[16,17],[16,18],[16,19],[16,20],[16,21],[16,22],[17,16],[17,17],[17,18],[17,19],[17,21],[17,22]];
_galati_grid = ["galati",[7,19],[7,20],[7,21],[7,22],[7,23],[8,19],[8,20],[8,21],[8,22],[8,23],[9,18],[9,19],[9,20],[9,21],[9,22],[9,23],[10,18],[10,19],[10,20],[10,21],[10,22],[11,18],[11,19],[11,20],[11,21],[11,22],[11,23]];
_kavala_grid = ["kavala",[2,9],[2,10],[2,11],[2,12],[2,13],[2,17],[2,18],[3,9],[3,10],[3,11],[3,12],[3,13],[3,14],[3,15],[3,17],[3,18],[4,9],[4,10],[4,11],[4,12],[4,13],[4,14],[4,15],[4,16],[4,17],[4,18],[5,9],[5,10],[5,11],[5,12],[5,13],[5,14],[5,15],[5,16],[5,17],[5,18],[6,14],[6,15],[6,16],[6,17],[6,18],[7,15],[7,16],[7,17],[7,18],[8,15],[8,16],[8,17],[8,18],[9,15],[9,16],[9,17],[10,15],[10,16],[10,17]];
_molos_grid = ["molos",[26,21],[26,22],[26,23],[26,24],[26,25],[27,21],[27,22],[27,23],[27,24],[27,25],[28,21],[28,22],[28,23],[28,24],[28,25]];
_oreokastro_grid = ["oreokastro",[2,19],[2,20],[2,21],[2,22],[3,19],[3,20],[3,21],[3,22],[4,19],[4,20],[4,21],[4,22],[5,19],[5,20],[5,21],[5,22],[6,19],[6,20],[6,21],[6,22]];
_panagia_grid = ["panagia",[16,8],[16,9],[16,10],[17,7],[17,8],[17,9],[17,10],[18,5],[18,6],[18,7],[18,8],[18,9],[18,10],[19,5],[19,6],[19,7],[19,8],[19,9],[19,10],[20,5],[20,6],[20,7],[20,8],[20,9],[20,10],[21,4],[21,5],[21,6],[21,7],[21,8],[21,9],[21,10],[21,11],[22,4],[22,5],[22,6],[22,7],[22,8],[22,10],[22,11],[23,6],[23,7]];
_pyrgos_grid = ["pyrgos",[14,10],[14,11],[15,10],[15,11],[16,11],[16,12],[16,13],[17,11],[17,12],[17,13],[17,14],[17,15],[18,11],[18,12],[18,13],[18,14],[18,15],[18,16],[18,17],[18,18],[18,19],[19,11],[19,12],[19,13],[19,14],[19,15],[19,16],[19,17],[19,18],[19,19],[19,20],[20,11],[20,12],[20,13],[20,14],[20,15],[20,16],[20,17],[20,18],[20,19],[20,20],[21,12],[21,13],[21,14],[21,15],[21,16],[21,17],[21,18],[21,19],[21,20],[21,21],[22,13],[22,14],[22,15],[22,16],[22,17],[22,18],[22,19],[22,20],[22,21],[23,13],[23,15],[23,16],[23,17],[23,18],[24,15],[24,16],[24,17]];
_sofia_grid = ["sofia",[22,22],[23,19],[23,20],[23,21],[23,22],[23,23],[23,24],[24,18],[24,19],[24,20],[24,21],[24,22],[24,23],[24,24],[25,18],[25,19],[25,20],[25,21],[25,22],[25,23],[26,19],[26,20],[27,20]];
_zaros_grid = ["zaros",[6,10],[6,11],[6,12],[6,13],[7,9],[7,10],[7,11],[7,12],[7,13],[7,14],[8,9],[8,10],[8,11],[8,12],[8,13],[8,14],[9,10],[9,11],[9,12],[9,13],[9,14],[10,11],[10,12],[10,13],[10,14],[11,11],[11,12],[11,13],[12,12],[12,13],[13,12],[13,13],[14,12],[14,13]];

_zone_list pushBack _agela_grid;
_zone_list pushBack _athira_grid;
_zone_list pushBack _galati_grid;
_zone_list pushBack _kavala_grid;
_zone_list pushBack _molos_grid;
_zone_list pushBack _oreokastro_grid;
_zone_list pushBack _panagia_grid;
_zone_list pushBack _pyrgos_grid;
_zone_list pushBack _sofia_grid;
_zone_list pushBack _zaros_grid;

lamp_list = [];

for "_i" from 0 to (count (_zone_list) - 1) do 
{
	_square_list = _zone_list select _i; //on récupère la zone en cours d'étude
	_list = []; //on crée le tableau qui va héberger la liste des lampadaires
	_list pushBack (_square_list select 0); //on met dans cette liste le nom de la zone correspondante
	for "_j" from 1 to (count (_square_list) - 1) do
	{
		_square = _square_list select _j; //on récupère ensuite le carré en cours d'étude
		_center = [_square] call LM_fnc_getSquareCenter; //on en détermine le centre
		for "_k" from 0 to (_lights_numb -1) do
		{
			_type = (_lights select _k);
			{
				_list pushBack _x;
			} forEach (_center nearObjects [_type, 500*(sqrt 2)]);
		};
		lamp_list pushBack _list;
	};
};

// Intendant
LM_INTENDANT disableAI "ALL";
LM_INTENDANT enableAI "ANIM";
// Initialisation du commandant
LM_COMMANDER disableAI "ALL";
LM_COMMANDER enableAI "ANIM";

// Blocage des officiers
_job = {
	LM_COMMANDER setDir 252;
	LM_INTENDANT setDir 105;
	LM_COMMANDER setPosATL [14166.412, 16246.308, 0.763];
	LM_INTENDANT setPosATL [14179.4,16278.3,0.00144577];
};
_pas_bouger = {
	params["_unit", "_state", "_reason"];
	if( (_unit in [LM_COMMANDER, LM_INTENDANT]) && _state ) then
	{
		[objNull, LM_COMMANDER] call ace_captives_fnc_doRemoveHandcuffs;
		[objNull, LM_INTENDANT] call ace_captives_fnc_doRemoveHandcuffs;
		call _job;
	};
};
["ace_captiveStatusChanged", _pas_bouger] call CBA_fnc_addEventHandler;
[_job, [], 0, 300, 0] call RWT_fnc_cronJobAdd;


//Chargement de l'état de la mission
LM_MISSION_REINIT = profileNamespace getVariable ["LM_MISSION_REINIT", false]; //définie si la mission doit récupérer son ancien état ou non
publicVariable "LM_MISSION_REINIT";

//Lancement du moteur de la mission
_nul = []execVM "mission_engine.sqf";