function scr_rm_game(){
	switch(game_state) {
		case "placement":
			//Change game size
			if device_mouse_check_button_pressed(0, mb_left) {
				if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_grid_size) {
					var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_grid_size);
					if _button.image_alpha == 1 {
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
				}
			}
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
				if (device_mouse_x(0) > 0 && device_mouse_x(0) < room_width) && (device_mouse_y(0) > 0 && device_mouse_y(0) < room_height) {
					if !instance_position(device_mouse_x(0), device_mouse_y(0), par_cell) {
						if instance_number(par_cell) < game_mode.cell_count {
							var _cell = instance_create_layer(device_mouse_x(0), device_mouse_y(0), "Instances", obj_cell);
							_cell.sprite_index = color_scheme.sprite;
						}
					} else {
						instance_destroy(instance_position(device_mouse_x(0), device_mouse_y(0), par_cell));
					}
				}
				scr_progress_generation();
			}
		
			if device_mouse_check_button_pressed(0, mb_left) {
				if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_highscore_start) {
					var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_highscore_start);
					if _button.image_alpha == 1 {
						if display_highscore_cells {
							display_highscore_cells = false;
						} else {
							display_highscore_cells = true;
						}
					}
				}
			}
			if keyboard_check_pressed(ord("D")) {
				if display_highscore_cells {
					display_highscore_cells = false;
				} else {
					display_highscore_cells = true;
				}
			}
			
			if device_mouse_check_button_pressed(0, mb_left) {
				if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_start) {
					var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_start);
					if _button.image_alpha == 1 {
						game_state = "simulation";
						ds_grid_copy(starting_grid, cell_grid);
						break;
					}
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
				game_state = "gameover";
				alarm[0] = -1;
				break;
			}
		break;
	
		case "gameover":
			scr_save_game();
			scr_load_game();
			
			with(par_cell) {
				if image_index == 0 {
					image_alpha = 0.5;	
				}
			}
			
			if device_mouse_check_button_pressed(0, mb_left) {
				if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_previous_start) {
					var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_previous_start);
					if _button.image_alpha == 1 {
						if display_previous_start_cells {
							display_previous_start_cells = false;
						} else {
							display_previous_start_cells = true;	
						}
					}
				}
			}
			
			if device_mouse_check_button_pressed(0, mb_left) {
				if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_restart) {
					var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_restart);
					if _button.image_alpha == 1 {
						instance_destroy(par_cell);
						ds_grid_clear(neighbor_grid, 0);
						ds_grid_clear(cell_grid, 0);
						generation_number = 0;
						ds_list_clear(grid_state_history);
						game_state = "placement";
					}
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
	
	//Info Display
	if device_mouse_check_button_pressed(0, mb_left) {
		if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_info) {
			var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_info);
			if _button.image_alpha == 1 {
				display_info_text = !display_info_text;
			}
		}
	}
	
	//Simulation Speed. # times per second
	if device_mouse_check_button_pressed(0, mb_left) {
		if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_slow_down) {
			var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_slow_down);
			if _button.image_alpha == 1 {
				settings.sim_speed = max(settings.sim_speed - 1, 1);
			}
		}
	}
	if device_mouse_check_button_pressed(0, mb_left) {
		if instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_speed_up) {
			var _button = instance_position(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button_speed_up);
			if _button.image_alpha == 1 {
				settings.sim_speed = min(settings.sim_speed + 1, 25);
			}
		}
	}
	if keyboard_check_pressed(ord("F")) {
		settings.sim_speed = min(settings.sim_speed + 1, 25);
	}
	if keyboard_check_pressed(ord("S")) {
		settings.sim_speed = max(settings.sim_speed - 1, 1);
	}
}