//exec: server

params["_target"];

// Trigger de conquête
_trigger = createTrigger ["EmptyDetector", getPos _target, false];
_trigger setTriggerArea [15, 8, getDir _target, true, 10];
_trigger setTriggerActivation ["WEST", "PRESENT", false];
_trigger setTriggerStatements ["this", "", ""];
LM_MISSION_TEMP pushback _trigger;

systemChat str _target;

// Boucle de renforts
while {!triggerActivated _trigger && alive _target} do {
	// Spawn d'un groupe de renforts
	_group = [getPos _target, east, (configfile >> "CfgGroups" >> "East" >> "LM_KICC" >> "kicc_infanterie_base" >> "assaut")] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	[_group] call LM_fnc_addInjurableGroup;
	{LM_MISSION_TEMP pushback _x}forEach (units _group);

	systemChat str _group;

	// Attente que groupe précédent endommagé
	waitUntil { sleep 60; count units _group < 5 };

	systemChat "dead";
};

systemChat "end";