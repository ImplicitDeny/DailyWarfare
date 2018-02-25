//this addEventHandler ["Fired",{private ["_bomb_type","_plane_player","_custom_napalm_bomb"]; _plane_player = _this select 0; _bomb_type = _this select 6; _custom_napalm_bomb = "Bomb_04_F"; [[_bomb_type,_plane_player,_custom_napalm_bomb],"AL_napalm\al_napalm_player.sqf"] remoteExec ["BIS_fnc_execVM"]}];

if (!isServer) exitWith {};

_bomb_type_al = _this select 0;
_plane_player_al = _this select 1;
_custom_napalm_bomb_al = _this select 2;

if (typeOf _bomb_type_al == _custom_napalm_bomb_al) then {

waitUntil {(getposATL _bomb_type_al select 2)<15};

	_dire  = getDir _plane_player_al;
	_dir_x = sin _dire;	
	_dir_y = cos _dire;	
	
	_poz_blow = [getPos _bomb_type_al select 0, getPos _bomb_type_al select 1];
	deletevehicle _bomb_type_al;

	_nap_obj_b = "Land_HelipadEmpty_F" createVehicle [_poz_blow select 0,_poz_blow select 1,0];
	
	[_poz_blow] spawn {
		_poz_destr = _this select 0;
		sleep 20;
		_nearobj = nearestObjects [_poz_destr, [], 50];
		{if !(_x isKindOf "Land_HelipadEmpty_F") then {_x setdamage 1};} foreach _nearobj;	
	};
	
	[[_nap_obj_b,_dir_x,_dir_y],"AL_napalm\alias_napalm_effect.sqf"] remoteExec ["BIS_fnc_execVM"];
	
	[_nap_obj_b] spawn {
		_loc_bomb = _this select 0;
		_nr_bat = floor (6+random 20);
		
		while {_nr_bat>0} do {
			private ["_vit_z","_vit_x","_vit_y","_buc_nap","_li_exp"];
				
			_vit_z = 10+random 50;
			_vit_x = ([1,-1] call BIS_fnc_selectRandom)* floor (10+random 30);
			_vit_y = ([1,-1] call BIS_fnc_selectRandom)* floor (10+random 30);

			_buc_nap = createVehicle ["Land_Battery_F", getPosATL _loc_bomb, [], 20, "CAN_COLLIDE"];

			//ataseaza smoke la baterii
			[[_buc_nap],"AL_napalm\alias_buc_nap.sqf"] remoteExec ["BIS_fnc_execVM"];
			
			_buc_nap setVelocity [_vit_x,_vit_y,_vit_z];
			[_buc_nap] spawn {_de_delete = _this select 0; sleep 6;	deleteVehicle _de_delete;};
			_nr_bat = _nr_bat-1;
		};
	};

	_nap_sec = "Land_HelipadEmpty_F" createVehicle [getPosATL _nap_obj_b select 0,(getPosATL _nap_obj_b select 1) + _dir_y*1.5,0];
	[[_nap_sec,_dir_x,_dir_y],"AL_napalm\alias_napalm_effect_sec.sqf"] remoteExec ["BIS_fnc_execVM"];
	
	// foc post nap
	[[_nap_sec,false,300,40,0.01,true,false],"ALfire\fire.sqf"] remoteExec ["BIS_fnc_execVM"];
	
	[_nap_obj_b] spawn { 
		_de_sters = _this select 0;
		sleep 300;
		deletevehicle _de_sters;
	};
};