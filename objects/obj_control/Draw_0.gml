switch(room) {
	case rm_start_menu:
		
	break;
	
	case rm_game:
		var _margin = 64;
		draw_rectangle_color(-_margin, -_margin, room_width + _margin, room_height + _margin, primary_color, primary_color, primary_color, primary_color, false);
		//Draw game grid outline
		for(var w = 0; w < (room_width / settings.cell_size) + 1; w++) {
			draw_line_color(w * settings.cell_size, 0, w * settings.cell_size, room_height, secondary_color, secondary_color);
		}

		for(var h = 0; h < (room_height / settings.cell_size) + 1; h++) {
			draw_line_color(0, h * settings.cell_size, room_width, h * settings.cell_size, secondary_color, secondary_color);
		}
		
		//Display highscore starting cells
		if display_highscore_cells {
			for(var i = 0; i < ds_grid_width(game_mode.highscore_grid); i++) {
				for(var j = 0; j < ds_grid_height(game_mode.highscore_grid); j++) {
					if game_mode.highscore_grid[# i,j] == 1 {
						var _x = (i * settings.cell_size) + (settings.cell_size/2) + grid_outline_width;
						var _y = (j * settings.cell_size) + (settings.cell_size/2) + grid_outline_width;
						draw_sprite_ext(color_scheme.sprite, 2, _x, _y, 1, 1, 0, c_white, 0.5);
					}
				}		
			}
		}
	break;
}


