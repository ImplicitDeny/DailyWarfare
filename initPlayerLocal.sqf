//exec: client

//vérification TeamSpeak
call LM_fnc_teamSpeakChecker;

// Attente de diffusion du statut de réinitialisation
waitUntil { !isNil "LM_MISSION_REINIT" };

/////////////////////////////////////   Interactions commandant   /////////////////////////////////////
_statement = {
	remoteExec ["LM_fnc_lancerMissionMain", 2];
};
_actionOrdres = ["startMission", "Obtenir de nouveaux ordres", "", _statement,{!LM_MISSION_STARTED}] call ace_interact_menu_fnc_createAction;
[LM_COMMANDER, 0, ["ACE_Head"], _actionOrdres] call ace_interact_menu_fnc_addActionToObject;

_modifier_reinit = {
	params ["_target", "_player", "_params", "_actionData"];
    // Modify the action - index 1 is the display name, 2 is the icon...
    _actionData set [1, format ["Réinit. au prochain redémarrage : %1", if(LM_MISSION_REINIT) then {"OUI"} else {"NON"}]];
};
_actionReinit = ["reinitMission", "Réinit. au prochain redémarrage : NON", "",{remoteExecCall ["LM_fnc_switchReinitValue", 2]},{serverCommandAvailable "#logout"},{},[],"",4,[false, false, false, false, false],_modifier_reinit] call ace_interact_menu_fnc_createAction;
[LM_COMMANDER, 0, ["ACE_Head"], _actionReinit] call ace_interact_menu_fnc_addActionToObject;





/////////////////////////////////////    Interactions intendant   /////////////////////////////////////
_statement_wellness = {
	_nul = [] execVM "scripts\cheitan_wellness.sqf";
};
_actionCasque = ["getSpecialHelmet", "Casque personnalisé", "", _statement_wellness,{true}] call ace_interact_menu_fnc_createAction;
[LM_INTENDANT, 0, ["ACE_Head"], _actionCasque] call ace_interact_menu_fnc_addActionToObject;



// Action de réinitialisation du loadout
_statement_reloadGear = {
	_player setUnitLoadout (typeOf _player);
	[LM_INTENDANT, _player] call ACE_medical_fnc_treatmentAdvanced_fullHeal;
	hint "Voila qui est fait !";
};
_actionGear = ["reloadLoadout", "Equipement de dotation", "", _statement_reloadGear,{true}] call ace_interact_menu_fnc_createAction;
[LM_INTENDANT, 0, ["ACE_Head"], _actionGear] call ace_interact_menu_fnc_addActionToObject;



// Récupérer des chargeurs supplémentaires
_statement_getMags = {
	params ["_target", "_player", "_params"];
	_nb = _params select 0;
	_player addMagazines [(primaryWeaponMagazine _player) select 0, _nb];
	hint format ["Voila %1 %2 pour vous !", _nb, (["chargeurs", "chargeur"] select (_nb isEqualTo 1))];
};
_actionMagMain = ["getMagMain", "Chargeurs supplémentaires", "", { hint "Oui mais combien en voulez-vous ?"; },{ count primaryWeaponMagazine player > 0 }] call ace_interact_menu_fnc_createAction;
[LM_INTENDANT, 0, ["ACE_Head"], _actionMagMain] call ace_interact_menu_fnc_addActionToObject;
_actionsMagArray = [];
_actionsMagArray pushBack (["getMag1", "1", "", _statement_getMags, {true}, {}, [1]] call ace_interact_menu_fnc_createAction);
_actionsMagArray pushBack (["getMag2", "2", "", _statement_getMags, {true}, {}, [2]] call ace_interact_menu_fnc_createAction);
_actionsMagArray pushBack (["getMag3", "3", "", _statement_getMags, {true}, {}, [3]] call ace_interact_menu_fnc_createAction);
_actionsMagArray pushBack (["getMag4", "4", "", _statement_getMags, {true}, {}, [4]] call ace_interact_menu_fnc_createAction);
{ [LM_INTENDANT, 0, ["ACE_Head", "getMagMain"], _x] call ace_interact_menu_fnc_addActionToObject } forEach _actionsMagArray;

// Réglage automatique sur canal général au spawn
waitUntil { !isNil {call TFAR_fnc_activeSwRadio} ; };
[(call TFAR_fnc_activeSwRadio), 8] call TFAR_fnc_setSwChannel;

// Ajout de matériel de navigation aux groupes spé médics et ingénieurs
if(vehicleVarName player in ["leader_echo", "leader_foxtrot"]) then {
	player addItem "ACE_microDAGR";
	player addItem "ACE_MapTools";
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "TFAR_microdagr";
	player linkItem "TFAR_anprc152";
};