//exec: server

params["_center"];

_list = _center nearObjects ["Land_i_House_Small_02_V1_F", 400];
_nb = count _list / 15;
for "_i" from 0 to _nb do
{
	_pri = selectRandom _list;
	//TODO
};