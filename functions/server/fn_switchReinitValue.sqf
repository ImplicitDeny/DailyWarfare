/*
	File: fn_markerCreation.sqf

	Description:
	Bascule la valeur de réinitialisation à l'inverse de sa valeur actuelle.
*/
LM_MISSION_REINIT = !(profileNamespace getVariable ["LM_MISSION_REINIT", false]);
profileNamespace setVariable ["LM_MISSION_REINIT", LM_MISSION_REINIT];
publicVariable "LM_MISSION_REINIT";
systemChat "switched";