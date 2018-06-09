//exec: server

params["_fob"];

_ret = switch(_fob) do
{
	case "greenvalley" : { "Green Valley"; };
	case "highwatch" : { "High Watch"; };
	case "roadtrip" : { "Roatrip"; };
	case "southblues" : { "South Blues"; };
};

_ret