// by ALIAS
// damage inflicted by fire
// obsolete but you can still use it if you want. Now damage is inflicted using setParticleFire

	_d = 0.01;
	
	while {fireexpunere} do {
		enableCamShake true;
		addCamShake [5, 1, 17];
		_d=_d+0.02;
		player setdammage _d;
		playsound "burned";
		sleep 2.5+random 1;	
		enableCamShake false;
	};
	
