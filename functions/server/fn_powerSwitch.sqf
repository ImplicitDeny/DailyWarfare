/*
	File: fn_objectCreation.sqf

	Description:
	To switch on/off lights in a specified zone.

	Parameter(s):
	_this select 0: zone (STRING - "agela", "athira", "galati", "kavala", "molos", "oreokastro", "panagia", "pyrgos", "sofia" or "zaros")
	_this select 1: mode (STRING - "off" to switch off lights)
	
*/

params["_zone","_mode"];


_indice = 0;
_condition = true;

while{_condition} do {

	if(lamp_list select _indice select 0 != _zone) then {
		
		_indice=_indice+1
	
	} else {
	
		_condition = false
	
	};
	
};

_tab = lamp_list select _indice;

_degats = 0;
if(_mode == "off") then {_degats = 0.97};


for "_i" from 1 to (count (_tab) -1) do {
	(_tab select _i) setDamage _degats;
};