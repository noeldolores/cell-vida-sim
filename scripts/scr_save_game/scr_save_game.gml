function scr_save_game() {
	ini_open("Save.ini");
	
	if generation_number > game_mode.highscore {
		switch(game_mode) {
			case settings.small:
				ini_write_real("small", "generations", generation_number);
				ini_write_string("small", "cells", ds_grid_write(starting_grid));
			break;		
		
			case settings.medium:
				ini_write_real("medium", "generations", generation_number);
				ini_write_string("medium", "cells", ds_grid_write(starting_grid));
			break;	
		
			case settings.large:
				ini_write_real("large", "generations", generation_number);
				ini_write_string("large", "cells", ds_grid_write(starting_grid));
			break;	
		}
		game_mode.highscore = generation_number;
	}
	ini_write_real("global", "primary color", primary_color);
	ini_write_real("global", "secondary color", secondary_color);
	
	ini_close();
}