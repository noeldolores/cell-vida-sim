function scr_match_color_scheme_on_load(primary_color) {
	switch(primary_color) {
		case #000000: //black
			return settings.color.black;
		break;
		case #FFFFFF: //white
			return settings.color.white;
		break;
		
		case #1ECBE1: //cyan
			return settings.color.cyan;
		break;
		case #E1341E: //red-orange
			return settings.color.red_orange;
		break;
		
		case #3EB489: //mint
			return settings.color.mint;
		break;
		case #B43E69: //pink
			return settings.color.pink;
		break;

		case #BDA842: //gold 
			return settings.color.gold;
		break;
		case #4257BD: //blue
			return settings.color.blue;
		break;
	}
}