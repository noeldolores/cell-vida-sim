function scr_rm_game(){
	switch(game_state) {
		case "placement":
			//Change game size
			if keyboard_check_pressed(ord("G")) {
				switch(game_mode) {
					case settings.small:
						game_mode = settings.medium;
					break;
					case settings.medium:
						game_mode = settings.large;
					break;
					case settings.large:
						game_mode = settings.small;
					break;
				}
				scr_game_size_reset();
				instance_destroy(par_cell);
			}
			//Add and Remove cells
			if device_mouse_check_button_pressed(0, mb_left) {
				if !instance_position(device_mouse_x(0), device_mouse_y(0), par_cell) {
					if instance_number(par_cell) < game_mode.cell_count {
						var _cell = instance_create_layer(device_mouse_x(0), device_mouse_y(0), "Instances", obj_cell);
						_cell.sprite_index = color_scheme.sprite;
					}
				} else {
					instance_destroy(instance_position(device_mouse_x(0), device_mouse_y(0), par_cell));
				}
				scr_progress_generation();
			}
		
			if keyboard_check_pressed(ord("D")) {
				if display_highscore_cells {
					display_highscore_cells = false;
				} else {
					display_highscore_cells = true;
				}
			
			}

			var _num_cell = instance_number(par_cell);
			if _num_cell == game_mode.cell_count {
				if keyboard_check_pressed(vk_space) || device_mouse_check_button_pressed(0, mb_right){
					game_state = "simulation";
					ds_grid_copy(starting_grid, cell_grid);
					break;
				}
			}
		break;
	
		case "simulation":
			display_highscore_cells = false;
		
			//Run 1 generation each alarm trigger
			if !alarm[0] {
				alarm[0] = 60 / settings.sim_speed;	
			}
			//End simulation if all cells die
			if !instance_exists(par_cell) {
				game_state = "history";
				alarm[0] = -1;
				break;
			}
		break;
	
		case "history":
			for(var i = 0; i < ds_grid_width(starting_grid); i++) {
				for(var j = 0; j < ds_grid_height(starting_grid); j++) {
					if starting_grid[# i,j] == 1 {
						var _cell = instance_create_layer(i * settings.cell_size, j * settings.cell_size, "Instances", obj_cell);
						_cell.sprite_index = color_scheme.sprite;
						_cell.image_index = 1;
						_cell.image_alpha = 0.5;
					}
				}		
			}
		
			game_state = "gameover";
		
			scr_save_game();
			scr_load_game();
		break;
	
		case "gameover":
			with(par_cell) {
				if image_index == 0 {
					image_alpha = 0.5;	
				}
			}
		
			if keyboard_check_pressed(ord("R")) {
				instance_destroy(par_cell);
				ds_grid_clear(neighbor_grid, 0);
				ds_grid_clear(cell_grid, 0);
				generation_number = 0;
				ds_list_clear(grid_state_history);
				game_state = "placement";
			}	
		break;
	}

	if keyboard_check_pressed(vk_escape) {
		game_end();
	}

	//Simulation Speed. # times per second
	if keyboard_check_pressed(ord("F")) {
		settings.sim_speed = min(settings.sim_speed + 1, 25);
	}
	if keyboard_check_pressed(ord("S")) {
		settings.sim_speed = max(settings.sim_speed - 1, 1);
	}


	//Debug
	if keyboard_check_pressed(ord("N")) {
		if debug_array.show_neighbor_grid {
			debug_array.show_neighbor_grid = false;
		} else {
			debug_array.show_neighbor_grid = true;
			debug_array.show_cell_grid = false;
		}
	}

	if keyboard_check_pressed(ord("C")) {
		if debug_array.show_cell_grid {
			debug_array.show_cell_grid = false;
		} else {
			debug_array.show_cell_grid = true;
			debug_array.show_neighbor_grid = false;
		}
	}
}