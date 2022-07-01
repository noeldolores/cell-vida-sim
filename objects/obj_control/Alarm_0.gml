/// @description Simulation
for(var i = 0; i < ds_grid_width(cell_grid); i++) {
	for(var j = 0; j < ds_grid_height(cell_grid); j++) {
		//Check live cells
		if cell_grid[# i,j] == 1 {
			var _live_cell = instance_position((i * settings.cell_size) + (settings.cell_size/2), (j * settings.cell_size) + (settings.cell_size/2), par_cell);
			if neighbor_grid[# i,j] < 2 || neighbor_grid[# i,j] > 3{
				instance_destroy(_live_cell)
			}
		//Check dead cells
		} else {
			if neighbor_grid[# i,j] == 3 { 
				var _cell = instance_create_layer(i * settings.cell_size, j * settings.cell_size, "Instances", obj_cell);
				_cell.sprite_index = color_scheme.sprite;
			}
		}
	}		
}
scr_progress_generation();
scr_evolution_check();