function scr_progress_generation() {
	if ds_list_size(grid_state_history) > 5 {
		ds_list_delete(grid_state_history, 0);	
	}
	ds_list_add(grid_state_history, ds_grid_write(cell_grid));
	
	
	ds_grid_clear(neighbor_grid, 0);
	ds_grid_clear(cell_grid, 0);
	
	if instance_exists(par_cell) {
		with(par_cell) {
			var _w = floor(x / other.settings.cell_size);
			var _h = floor(y / other.settings.cell_size);
			other.cell_grid[# _w, _h] = 1;
		
			var max_w = ds_grid_width(other.cell_grid) - 1;
			var max_h = ds_grid_height(other.cell_grid) - 1;
		
			if _w == 0 {
				if _h == 0 {
					other.neighbor_grid[# _w, min(_h + 1, max_h)] += 1; //bottom
					other.neighbor_grid[# min(_w + 1, max_w), _h] += 1; //right	
					other.neighbor_grid[# min(_w + 1, max_w), min(_h + 1, max_h)] += 1;	//bottom-right
				} else if _h == max_h {
					other.neighbor_grid[# _w, max(_h - 1, 0)] += 1;	//top
					other.neighbor_grid[# min(_w + 1, max_w), _h] += 1; //right
					other.neighbor_grid[# min(_w + 1, max_w), max(_h - 1, 0)] += 1; //top-right
				} else {
					other.neighbor_grid[# _w, max(_h - 1, 0)] += 1;	//top
					other.neighbor_grid[# _w, min(_h + 1, max_h)] += 1; //bottom
					other.neighbor_grid[# min(_w + 1, max_w), _h] += 1; //right
					other.neighbor_grid[# min(_w + 1, max_w), max(_h - 1, 0)] += 1; //top-right
					other.neighbor_grid[# min(_w + 1, max_w), min(_h + 1, max_h)] += 1;	//bottom-right
				}
			} else if _w == max_w {
				if _h == 0 {
					other.neighbor_grid[# _w, min(_h + 1, max_h)] += 1; //bottom
					other.neighbor_grid[# max(_w - 1, 0), _h] += 1;	//left
					other.neighbor_grid[# max(_w - 1, 0), min(_h + 1, max_h)] += 1; //bottom-left
				} else if _h == max_h {
					other.neighbor_grid[# _w, max(_h - 1, 0)] += 1;	//top
					other.neighbor_grid[# max(_w - 1, 0), _h] += 1;	//left
					other.neighbor_grid[# max(_w - 1, 0), max(_h - 1, 0)] += 1;	//top-left
				} else {
					other.neighbor_grid[# _w, max(_h - 1, 0)] += 1;	//top
					other.neighbor_grid[# _w, min(_h + 1, max_h)] += 1; //bottom
					other.neighbor_grid[# max(_w - 1, 0), _h] += 1;	//left
					other.neighbor_grid[# max(_w - 1, 0), max(_h - 1, 0)] += 1;	//top-left
					other.neighbor_grid[# max(_w - 1, 0), min(_h + 1, max_h)] += 1; //bottom-left
				}
			} else if _h == 0 {
				other.neighbor_grid[# _w, min(_h + 1, max_h)] += 1; //bottom
				other.neighbor_grid[# max(_w - 1, 0), _h] += 1;	//left
				other.neighbor_grid[# min(_w + 1, max_w), _h] += 1; //right
				other.neighbor_grid[# max(_w - 1, 0), min(_h + 1, max_h)] += 1; //bottom-left
				other.neighbor_grid[# min(_w + 1, max_w), min(_h + 1, max_h)] += 1;	//bottom-right
			} else if _h == max_h {
				other.neighbor_grid[# _w, max(_h - 1, 0)] += 1;	//top
				other.neighbor_grid[# max(_w - 1, 0), _h] += 1;	//left
				other.neighbor_grid[# min(_w + 1, max_w), _h] += 1; //right
				other.neighbor_grid[# max(_w - 1, 0), max(_h - 1, 0)] += 1;	//top-left
				other.neighbor_grid[# min(_w + 1, max_w), max(_h - 1, 0)] += 1; //top-right
			} else {
				other.neighbor_grid[# _w, max(_h - 1, 0)] += 1;	//top
				other.neighbor_grid[# _w, min(_h + 1, max_h)] += 1; //bottom
				other.neighbor_grid[# max(_w - 1, 0), _h] += 1;	//left
				other.neighbor_grid[# min(_w + 1, max_w), _h] += 1; //right
				other.neighbor_grid[# max(_w - 1, 0), max(_h - 1, 0)] += 1;	//top-left
				other.neighbor_grid[# min(_w + 1, max_w), max(_h - 1, 0)] += 1; //top-right
				other.neighbor_grid[# max(_w - 1, 0), min(_h + 1, max_h)] += 1; //bottom-left
				other.neighbor_grid[# min(_w + 1, max_w), min(_h + 1, max_h)] += 1;	//bottom-right
			}
		}
	}
}