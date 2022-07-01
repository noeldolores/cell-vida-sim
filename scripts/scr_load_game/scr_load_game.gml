function scr_load_game() {
	ini_open("Save.ini");
	
	settings.small.highscore = ini_read_real("small", "generations", 0);
	ds_grid_read(settings.small.highscore_grid, ini_read_string("small", "cells", ""));
	
	settings.medium.highscore = ini_read_real("medium", "generations", 0);
	ds_grid_read(settings.medium.highscore_grid, ini_read_string("medium", "cells", ""));
	
	settings.large.highscore = ini_read_real("large", "generations", 0);
	ds_grid_read(settings.large.highscore_grid, ini_read_string("large", "cells", ""));
	
	primary_color = ini_read_real("global", "primary color", #000000);
	secondary_color = ini_read_real("global", "secondary color", #FFFFFF);
	ini_close();
}