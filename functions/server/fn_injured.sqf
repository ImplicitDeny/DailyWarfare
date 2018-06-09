params["_target"];

[_target, (selectRandom ["Hit1", "Hit2", "Hit3", "Hit4", "Hit5", "Hit6", "Hit7", "Hit8", "Hit9", "Hit10"]) ] remoteExec [ "say3D", 0];

if(damage _target < 0.20 && alive _target) then
{
	// _target removeAllEventHandlers "Hit";
	// _anim = selectRandom [
		// "AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon", "AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon", "AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon_old",
		// "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon", "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"
	// ];
	// [_target, _anim ] remoteExec [ "switchMove", 0];
	// _target setBehaviour "COMBAT";
	// sleep 5;
	// [_target, "" ] remoteExec [ "switchMove", 0];
	
} else {
	_target setUnconscious true;

	_target removeAllEventHandlers "Hit";
	_target disableAI "TARGET";
	_target disableAI "AUTOTARGET";
	_target disableAI "MOVE";
	_target disableAI "TEAMSWITCH";
	_target disableAI "FSM";
	_target disableAI "AIMINGERROR";
	_target disableAI "SUPPRESSION";
	_target disableAI "COVER";
	_target disableAI "AUTOCOMBAT";
	_target disableAI "PATH";
	
	sleep 5;
	
	_animArray = [
		"UnconsciousReviveArms_A","UnconsciousReviveArms_B","UnconsciousReviveArms_C","UnconsciousReviveBody_A",
		"UnconsciousReviveBody_B","UnconsciousReviveDefault_A","UnconsciousReviveDefault_B","UnconsciousReviveHead_A",
		"UnconsciousReviveHead_B","UnconsciousReviveHead_C","UnconsciousReviveLegs_A","UnconsciousReviveLegs_B"
	];
	[_target, (_animArray call BIS_fnc_selectRandom) ] remoteExec [ "switchMove", 0];
	
	_i = 0;
	while { (lifeState _target isEqualTo "INCAPACITATED") && (_i < 12) } do {
		[_target, (selectRandom ["Pain1", "Pain2", "Pain3", "Pain4", "Pain5", "Pain6", "Pain7", "Pain8", "Pain9"]) ] remoteExec [ "say3D", 0];
		_i = _i+1;
		sleep (10 + floor(random 20));
	};

	_target setDamage 1;
};

// TODO : setMimic ?

