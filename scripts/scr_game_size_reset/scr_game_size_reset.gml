function scr_game_size_reset(){
	room_width = game_mode.width;
	room_height = game_mode.height;
	camera_set_view_size(view_camera[0], game_mode.width + game_mode.margin, game_mode.height + game_mode.margin);
	camera_set_view_pos(view_camera[0], 0 - (game_mode.margin/2), 0 - (game_mode.margin/2));

	grid_width = room_width / settings.cell_size;
	grid_height = room_height / settings.cell_size;

	neighbor_grid = ds_grid_create(grid_width, grid_height);
	ds_grid_clear(neighbor_grid, 0);

	cell_grid = ds_grid_create(grid_width, grid_height);
	ds_grid_clear(cell_grid, 0);
	
	starting_grid = ds_grid_create(grid_width, grid_height);
	ds_grid_clear(starting_grid, 0);
}