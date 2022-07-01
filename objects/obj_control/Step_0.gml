switch(room) {
	case rm_start_menu:
		scr_rm_start_menu();
	break;
	
	case rm_game:
		scr_rm_game();
	break;
}

if keyboard_check_pressed(ord("C")) {
	switch(color_scheme) {
		case settings.color.black:
			color_scheme = settings.color.white;
		break;
		case settings.color.white:
			color_scheme = settings.color.cyan;
		break;
		
		case settings.color.cyan:
			color_scheme = settings.color.red_orange;
		break;
		case settings.color.red_orange:
			color_scheme = settings.color.mint;
		break;
		
		case settings.color.mint:
			color_scheme = settings.color.pink;
		break;
		case settings.color.pink:
			color_scheme = settings.color.gold;
		break;
		
		case settings.color.gold:
			color_scheme = settings.color.blue;
		break;
		case settings.color.blue:
			color_scheme = settings.color.black;
		break;
	}
	primary_color = color_scheme.primary;
	secondary_color = color_scheme.secondary;
	scr_save_game();
	with(par_cell) {
		sprite_index = other.color_scheme.sprite;	
	}
}