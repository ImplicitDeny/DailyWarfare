if(call TFAR_fnc_isTeamSpeakPluginEnabled) exitWith {};
_bw = ppEffectCreate ["colorCorrections", 1501];
_bw ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
_bw ppEffectCommit 1;
_bw ppEffectEnable TRUE;

sleep 2;

titleText ["<t size=2>Merci de rejoindre notre serveur TeamSpeak</t>", "PLAIN", 3, true, true];

while{!call TFAR_fnc_isTeamSpeakPluginEnabled} do {
	sleep 1;
	titleText ["<t size=2>Merci de rejoindre notre serveur TeamSpeak</t>", "PLAIN", 0, true, true];
};

titleText["", "PLAIN"];
ppEffectDestroy _bw;