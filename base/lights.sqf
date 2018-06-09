neon_pc_1 = ["UserTexture1m_F",[14152.5,16249.5,4.211],0,"",false] call LM_fnc_objectCreation;
neon_pc_2 = ["UserTexture1m_F",[14162.6,16245.3,4.172],0,"",false] call LM_fnc_objectCreation;
neon_pc_3 = ["UserTexture1m_F",[14174.9,16245.8,3.714],0,"",false] call LM_fnc_objectCreation;
neon_fob_pc_marina = ["UserTexture1m_F",[14187.9,16311.8,2.933],0,"",false] call LM_fnc_objectCreation;
neon_fob_uav = ["UserTexture1m_F",[14479.7,16320.5,3.274],0,"",false] call LM_fnc_objectCreation;
neon_spawn_pilotes_1 = ["UserTexture1m_F",[14475.6,16324.2,3.207],0,"",false] call LM_fnc_objectCreation;
neon_spawn_pilotes_2 = ["UserTexture1m_F",[15395.4,15877.3,5.47],0,"",false] call LM_fnc_objectCreation;

{
light = "#lightpoint" createVehicle [1,1,1];
light setLightColor [10, 20, 30];
light setLightAmbient[0, 0.2, 0.2];
light setLightBrightness 0.05;
light setLightAttenuation [0.1, 0, 0, 0];
light setLightUseFlare false;
light setLightFlareSize 0;
light setLightDayLight false;
light lightAttachObject [_x, [0,0,0]];
} forEach [neon_pc_1,neon_pc_2,neon_pc_3,neon_fob_pc_marina,neon_fob_uav,neon_spawn_pilotes_1,neon_spawn_pilotes_2];