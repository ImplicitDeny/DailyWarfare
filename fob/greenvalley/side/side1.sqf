// ------ Déminage Makrynisi -----
// Author : [LM]Cheitan
// Team   : La Muerta

_marker_greenvalley_side1 = createMarker ["marker_greenvalley_side1", [13580.6,12186.1]];
"marker_greenvalley_side1" setMarkerShape "ellipse";
"marker_greenvalley_side1" setMarkerSize [50,50];
"marker_greenvalley_side1" setMarkerAlpha 0.6;
"marker_greenvalley_side1" setMarkerBrush "Horizontal";
"marker_greenvalley_side1" setMarkerColor "ColorOpfor";

[WEST,["task_greenvalley_side1","task_fob_greenvalley"],["L'île de <marker name='marker_greenvalley_side1'>Makrynisi</marker> est une réserve ornithologique reconnue dans tout le bassin méditerranéen. Elle a presque été épargnée par la guerre. Presque, parce qu'il y a des mois de cela, l'ancien commandant en charge des opérations a craint que le KICC n'y infiltre des équipes de nageurs de combat, dont le but serait d'atteindre tout navire cherchant à entrer dans le golfe. Il a donc fait évacuer un peu brusquement les biologistes encore présent, et a fait recouvrir l'île de mines APERS à pression.<br/><br/>Le commandement actuel juge cet état de fait problématique. Le KICC ayant été repoussé de la région, la communauté scientifique fait pression pour avoir de nouveau accès à l'île. Le déminage a donc été effectué, mais le Génie a égaré le plan de minage concernant les environs immédiats de l'ancien camp de base des biologistes. Votre tâche est donc de déminer le terrain dans un rayon de 50m à l'ancienne, au détecteur à métaux. Le génie nous a toutefois informé que précisément 24 mines manquent à l'inventaire. Faisons en sorte de les retrouver.<br/><br/>NOTE : utilisation du matériel ACE uniquement, pas de détecteur vanilla", "Déminage ornithologique", "marker_greenvalley_side1"],getMarkerPos "marker_greenvalley_side1",true,1,true,"mine"] call BIS_fnc_taskCreate;

_mines = [];

// Génération champ de mines
for "_i" from 0 to 23 do {
	_pos = ["marker_greenvalley_side1"] call CBA_fnc_randPosArea;
	_mines pushBack (createMine ["APERSMine", _pos, [], 0]);
};

waitUntil { sleep 5; count ([13580.6,12186.1,0] nearObjects ["MineBase", 50]) == 0 };

["task_greenvalley_side1", "SUCCEEDED"] call BIS_fnc_taskSetState;
deleteMarker "marker_greenvalley_side1";