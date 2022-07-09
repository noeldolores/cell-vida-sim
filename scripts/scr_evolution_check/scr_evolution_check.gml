function scr_evolution_check() {
	if (ds_grid_write(cell_grid) == grid_state_history[| 0]) || (ds_grid_write(cell_grid) == grid_state_history[| 1]) || 
		(ds_grid_write(cell_grid) == grid_state_history[| 2]) || (ds_grid_write(cell_grid) == grid_state_history[| 3]) ||
		(ds_grid_write(cell_grid) == grid_state_history[| 4]) || (ds_grid_write(cell_grid) == grid_state_history[| 5]) {
		game_state = "gameover";
		alarm[0] = -1;	
	} else {
		generation_number += 1;	
	}
}