// ------ Side mission de test -----
// Author : [LM]Cheitan
// Team   : La Muerta

[WEST,["task_highwatch_side2","task_fob_highwatch"],["La garnison en place au FOB <marker name='marker_fob_highwatch'>High Watch</marker> a noté qu'à plusieurs endroits la route entre Galati et Abdera est encombrée de rochers. Les environs sont en effets assez arides, et soumis à une forte érosion, causant régulièrement des chutes de pierres sur les routes. Un blindé équipé d'une pelle vous attend au FOB, utilisez-le pour dégager la route entre les deux villes. Certains rochers devront peut-être d'abord être brisés à l'aide d'explosifs.", "Chute de pierres", ""],objNull,true,1,true,"use"] call BIS_fnc_taskCreate;

// Spawn des gros rochers
_positions = [[9556.98,20138.4,0.0065918],[9812.29,19891.9,0]];
_pos1 = _positions deleteAt (selectRandom [0,1]);
_rock1 = createVehicle ["Land_SharpRock_apart", _pos1, [], 0, "NONE"];

if(random 1 < 0.6) then {
	_rock2 = createVehicle ["Land_SharpRock_apart", _positions, [], 0, "NONE"];
};

// Spawn des petites pierres
// site 1
[["Land_Small_Stone_02_F",[10404.3,19317.9,0.459]],["Land_Limestone_01_03_F",[10400.1,19317.2,0.565002]],["Land_SharpStone_03",[10394.3,19322,-0.0226746]],["Land_SharpStone_02",[10387,19324.7,-0.135315]]];

[["Land_SharpStone_01",[9798.03,19902.5,-0.00523376]],["Land_Cliff_stone_big_F",[9797.3,19907.4,-0.0233765]],["Land_BluntStone_02",[9824.51,19880.7,-0.0220032]]];

[["Land_BluntStone_01",[9561.79,20122.5,0.0763092]],["Land_W_sharpStone_02",[9556.07,20123.8,0.0652618]]];

















_pos = [9554,20143,0];
_target = createVehicle ["LM_ZAMAK_COVERED", _pos, [], 0, "NONE"];
_target setDir 150;
_target setFuel 0;
_target setPosATL _pos;
(LM_MISSION_FOB_TEMP select 1) pushBack _target;

_trigger = createTrigger ["EmptyDetector", getMarkerPos "marker_fob_highwatch", false];
_trigger triggerAttachVehicle [_target];
_trigger setTriggerArea [10, 10, 0, false];
_trigger setTriggerActivation ["VEHICLE", "PRESENT", true];
_trigger setTriggerStatements ["this", "
	['task_highwatch_side1', 'SUCCEEDED'] call BIS_fnc_taskSetState;
", ""];


waitUntil { triggerActivated _trigger };
deleteVehicle _trigger;
