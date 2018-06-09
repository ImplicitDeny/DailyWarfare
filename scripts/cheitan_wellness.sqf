//exec: client

// Cheitan Wellness
_casque = switch (profileName) do {
	case ("[LM] Cheitan"): { "LM_OPS2_AOR1_CHEITAN" };
	case ("[LM] TanK"): { "LM_OPS2_AOR1_TANK" };
	case ("Arwyn"): { "LM_OPS2_AOR1_ARWYN" };
	case ("Cafeine"): { "LM_OPS2_AOR1_CAF" };
	case ("[LM] epicfail867"): { "LM_OPS2_AOR1_EPIC" };
	case ("Francky4533"): { "LM_OPS2_AOR1_FRANCKY" };
	case ("xhadgunx"): { "LM_OPS2_AOR1_HADGUN" };
	case ("[LM]Karoucho"): { "LM_OPS2_AOR1_KAROU" };
	case ("[LM] SnackSnake"): { "LM_OPS2_AOR1_SNACK" };
	case ("[LM]Syh"): { "LM_OPS2_AOR1_SYH" };
	case ("[LM] Stark"): { "LM_OPS2_AOR1_STARK" };
	default { "" };
};

// Slots réservés
_liste_reserves = ["LM_BASE_MEDIC","LM_SPECIAL_HELIPILOTE","LM_SPECIAL_PILOTE","LM_BASE_OFFICIER","LM_BASE_DOCTEUR"];

if!((_casque isEqualTo "") || (typeOf player in _liste_reserves)) then
{
	player addHeadgear _casque;
	hint "Le voilà ! Prenez-en soin !";
} else {
	hint "Il semble que non... Demandez à [LM] Cheitan si vous êtes membre LM et que vous ne pouvez pas avoir votre casque personnalisé. Pour rappel, certains slots comme pilote ou médecin disposent déjà d'un casque particulier.";
};