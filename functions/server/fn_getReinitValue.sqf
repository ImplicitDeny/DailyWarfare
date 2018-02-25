/*
	Description:
	Récupère la valeur actuelle de réinitialisation.
*/

if!(isServer) exitWith {"INVALID TRY"};

profileNamespace getVariable ["LM_MISSION_REINIT", false]