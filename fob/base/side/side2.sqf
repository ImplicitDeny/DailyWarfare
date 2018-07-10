// ------ Side - épave -----
// Author : [LM]Cheitan
// Team   : La Muerta

centre = [15303,14304,0];

bateau = createVehicle["Land_UWreck_FishingBoat_F", [0,0,0], [], 0, "NONE"];
bateau setPosASL (centre getPos [1000, random 360]);
bateau setDir 195;

marker = createMarker["marker_kormos", [15303,14304,0]];

[WEST,["task_side_kormos","task_fob_greenvalley"],["Dans les premières semaines du conflit, un équipage KICC a utilisé un navire civil réquisitionné pour tenter d'approcher l'aéroport d'Altis, dans un but qui nous est resté inconnu. La tentative a échouée, et le navire, nommé le Kormós, fut coulé au milieu du <marker name='marker_kormos'>golfe de Pyrgos</marker> par un de nos drones. Dans la brève bataille, une embarcation civile fut accidentellement atteinte sous la ligne de flottaison par un obus de 30mm tiré depuis le port. L'équipage fut secouru mais le petit bateau coula à pic, sans que ne soit relevées les coordonnées exactes. D'après les témoignages, il doit se situer à quelques centaines de mètres de l'épave du Kormós. Cette dernière étant la seule répertoriée dans cette partie du golfe, toute autre masse métallique détectée par nos senseurs devrait être le petit navire civil. Son propriétaire nous demande de remonter ses affaires personnelles qui se trouvaient à bord, dans un caisson étanche. Triangulez la position de l'épave et plongez pour retrouver ce caisson. Vous disposez d'un outil sur tous les bateaux indiquant la direction approximative de la masse métallique sous-marine la plus proche. Attention toutefois, l'outil est peu efficace lorsqu'il est trop proche de la masse métallique. Il peut aussi indiquer la direction de l'épave du Kormós si vous êtes plus proche de sa position que de la cible.", "Epave du Kormós", "marker_kormos"],[15303,14304,0],true,1,true,"search"] call BIS_fnc_taskCreate;

_statement = {
	_output = "";
	if!(surfaceIsWater position player) then {_output = "Detect. : NONE"}
	else {
		_near = [getPosASL bateau, centre] select (player distance2D bateau > player distance2D centre);
		// On renvoie non pas (direction exacte + modificateur) mais (direction exacte vers position random dans un rayon de 200m)
		// Merci [LM]Arwyn pour l'astuce
		_fake = _near getPos [random 200, random 360];
		_output = format["Detect. : %1", floor(player getDir _fake)];
	};
	
	hint str _output;
};
player addAction ["Sonder", _statement];

waitUntil{ !alive bateau };

["task_side_kormos", "SUCCEEDED"] call BIS_fnc_taskSetState;