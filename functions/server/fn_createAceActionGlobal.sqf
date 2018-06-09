//exec server

params[
	"_target",
	"_type",
	"_parent_path",
	"_name",
	"_display_text",
	"_icon",
	"_statement",
	"_condition",
	["_children_code",{}],
	["_action_parameters",[]],
	["_position",{[0,0,0]}],
	["_distance",2],
	["_other_paramaters",[false, false, false, false, false]],
	["_modifier_function",{}]
];

_jipID = [_target,_type,_parent_path,_name,_display_text,_icon,_statement,_condition,_children_code,_action_parameters,_position,_distance,_other_paramaters,_modifier_function] remoteExecCall ["LM_fnc_createAceActionLocal", 0, true];

_jipID