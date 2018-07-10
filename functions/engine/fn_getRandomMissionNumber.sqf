params["_type","_fob",["_zone", ""]];
_val = 0;
if(_type == "main") then {
	_val = switch(_fob) do
	{
		case "base":
		{
			switch (_zone) do 
			{
				case "pyrgos": { 2 };
			};
		};
		case "greenvalley":
		{
			switch (_zone) do 
			{
				case "agios_dionysios": { 3 };
				case "kavala": { 2 };
				case "panochori": { 2 };
				case "zaros": { 2 };
			};
		};
		case "highwatch":
		{
			switch (_zone) do 
			{
				case "mars": { 1 };
				case "negades": { 2 };
				case "oreokastro": { 1 };
				case "montagnes_est": { 1 };
			};
		};
		case "roadtrip":
		{
			switch (_zone) do 
			{
				case "paros_kalochori": { 4 };
				case "sofia": { 2 };
				case "almyra": { 1 };
				case "pefkas": { 1 };
			};
		};
		case "southblues":
		{
			switch (_zone) do 
			{
				case "agia_pelagia": { 1 };
				case "carriere": { 1 };
				case "chalkeia": { 3 };
			};
		};
	};
} else {
	_val = switch(_fob) do
	{
		case "base": { 1 };
		case "greenvalley": { 1 };
		case "highwatch": { 1 };
		case "roadtrip": { 2 };
		case "southblues": { 1 };
	};
};

_ret = 1 + floor(random _val);
_ret