//exec : client

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};

["Preload"] call BIS_fnc_arsenal;
_nul = [] execVM "briefing.sqf";

//Grille électrique - interaction ACE
/*
private _agela_power_plant_off = ["PowerOff","Désactiver centrale","",{["agela","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _agela_power_plant_on = ["PowerOn","Activer centrale","",{["agela","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _athira_power_plant_off = ["PowerOff","Désactiver centrale","",{["athira","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _athira_power_plant_on = ["PowerOn","Activer centrale","",{["athira","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _galati_power_plant_off = ["PowerOff","Désactiver centrale","",{["galati","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _galati_power_plant_on = ["PowerOn","Activer centrale","",{["galati","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _kavala_power_plant_off = ["PowerOff","Désactiver centrale","",{["kavala","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _kavala_power_plant_on = ["PowerOn","Activer centrale","",{["kavala","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _molos_power_plant_off = ["PowerOff","Désactiver centrale","",{["molos","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _molos_power_plant_on = ["PowerOn","Activer centrale","",{["molos","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _oreokastro_power_plant_off = ["PowerOff","Désactiver centrale","",{["oreokastro","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _oreokastro_power_plant_on = ["PowerOn","Activer centrale","",{["oreokastro","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _panagia_power_plant_off = ["PowerOff","Désactiver centrale","",{["panagia","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _panagia_power_plant_on = ["PowerOn","Activer centrale","",{["panagia","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _pyrgos_power_plant_off = ["PowerOff","Désactiver centrale","",{["pyrgos","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _pyrgos_power_plant_on = ["PowerOn","Activer centrale","",{["pyrgos","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _sofia_power_plant_off = ["PowerOff","Désactiver centrale","",{["sofia","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _sofia_power_plant_on = ["PowerOn","Activer centrale","",{["sofia","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;

private _zaros_power_plant_off = ["PowerOff","Désactiver centrale","",{["zaros","off"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
private _zaros_power_plant_on = ["PowerOn","Activer centrale","",{["zaros","on"] remoteExecCall ["LM_fnc_powerSwitch",2];},{true}] call ace_interact_menu_fnc_createAction;
	
[agela_power_plant_laptop, 0, ["ACE_MainActions"], _agela_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[agela_power_plant_laptop, 0, ["ACE_MainActions"], _agela_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[athira_power_plant_laptop, 0, ["ACE_MainActions"], _athira_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[athira_power_plant_laptop, 0, ["ACE_MainActions"], _athira_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[galati_power_plant_laptop, 0, ["ACE_MainActions"], _galati_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[galati_power_plant_laptop, 0, ["ACE_MainActions"], _galati_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[kavala_power_plant_laptop, 0, ["ACE_MainActions"], _kavala_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[kavala_power_plant_laptop, 0, ["ACE_MainActions"], _kavala_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[molos_power_plant_laptop, 0, ["ACE_MainActions"], _molos_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[molos_power_plant_laptop, 0, ["ACE_MainActions"], _molos_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[oreokastro_power_plant_laptop, 0, ["ACE_MainActions"], _oreokastro_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[oreokastro_power_plant_laptop, 0, ["ACE_MainActions"], _oreokastro_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[panagia_power_plant_laptop, 0, ["ACE_MainActions"], _panagia_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[panagia_power_plant_laptop, 0, ["ACE_MainActions"], _panagia_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[pyrgos_power_plant_laptop, 0, ["ACE_MainActions"], _pyrgos_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[pyrgos_power_plant_laptop, 0, ["ACE_MainActions"], _pyrgos_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[sofia_power_plant_laptop, 0, ["ACE_MainActions"], _sofia_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[sofia_power_plant_laptop, 0, ["ACE_MainActions"], _sofia_power_plant_on] call ace_interact_menu_fnc_addActionToObject;

[zaros_power_plant_laptop, 0, ["ACE_MainActions"], _zaros_power_plant_off] call ace_interact_menu_fnc_addActionToObject;
[zaros_power_plant_laptop, 0, ["ACE_MainActions"], _zaros_power_plant_on] call ace_interact_menu_fnc_addActionToObject;
*/