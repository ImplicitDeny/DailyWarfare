params ["_unit"];

if (_unit isKindOf "Man") then {
	_unit addEventHandler ["Hit",{
		_this spawn LM_fnc_injured;
	}];
};