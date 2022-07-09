switch(room) {
	case rm_start_menu:
		
		draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), primary_color, primary_color, primary_color, primary_color, false);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(secondary_color);
		
		draw_set_font(fn_title);
		draw_text(display_get_gui_width()/2, font_get_size(fn_title), "Cell Vida Sim");
		
		draw_set_font(fn_title_instructions_bold);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 2, "How to Play:");
		draw_set_font(fn_title_instructions);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 2.5, "Click on empty spaces to place a cell until the limit is reached.");
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 3, "Begin the simulation to watch your creation evolve!");
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 3.5, "How many generations will they survive?");
		
		draw_set_font(fn_title_instructions_bold);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 4.5, "Every step of the simulation the following occurs:");
		draw_set_font(fn_title_instructions);
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 5, "Cells with two or three neighboring cells remain unchanged.");
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 5.5, "Empty spaces with three neighboring cells turn into a cell.");
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 6, "All other cells are destroyed.");
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 6.5, "The simulation runs until either no cells remain or a repeating pattern occurs.");
		
		draw_text(display_get_gui_width()/2, display_get_gui_height()/10 * 8, "Press [C] at any time to change the color palette.");
		draw_set_font(fn_default);
		if !alarm[1] {
			alarm[1] = 60 * 0.5;
		}
		if display_start_menu_text {
			switch(os_type) {
				case os_windows:
					draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "Press [Space] or [Click] to Start");
				break;
				case os_android:
					draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "[Tap] to Start");
				break;
			}
		}
		
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fn_default);
		draw_set_color(c_white);
		
		
	break;
	
	case rm_game:
		draw_set_color(secondary_color);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		var x_margin = 64;
		var y_margin = 32;
		switch(game_state) {
			case "placement":
				draw_text(display_get_gui_width()/2, y_margin, "Cells: " + string(game_mode.cell_count - instance_number(par_cell)));

				if instance_number(par_cell) != game_mode.cell_count {
					draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "Click to Place or Remove Cells");
				}
				
				if display_info_text {
					draw_set_font(fn_info);
					
					var _box_x1 = 96;
					var _box_x2 = 416;
					var _box_y1 = 64;
					var _box_y2 = 96;
					draw_rectangle_color(_box_x1, _box_y1, _box_x2, _box_y2, secondary_color, secondary_color, secondary_color, secondary_color, false);
					var _line_x = 72;
					var _line_y1 = 48;
					var _line_y2 = 96;
					draw_line_width_color(_line_x, _line_y1, _line_x, (_box_y1 + _box_y2)/2, 4, secondary_color, secondary_color);
					draw_line_width_color(_line_x, (_box_y1 + _box_y2)/2, _line_y2, (_box_y1 + _box_y2)/2, 4, secondary_color, secondary_color);
					draw_text_color((_box_x1 + _box_x2)/2, (_box_y1 + _box_y2)/2, "Highest Generation reached.", primary_color, primary_color, primary_color, primary_color, 1);
					
					
					draw_rectangle_color(display_get_gui_width()/2 - 160, 64, display_get_gui_width()/2 + 160, 96, secondary_color, secondary_color, secondary_color, secondary_color, false);
					draw_text_color(display_get_gui_width()/2, 80, "Cells to place before starting.", primary_color, primary_color, primary_color, primary_color, 1);
					
					draw_rectangle_color(display_get_gui_width() - 396 - 32, 64, display_get_gui_width() - 58 - 32, 96, secondary_color, secondary_color, secondary_color, secondary_color, false);
					draw_text_color(display_get_gui_width() - 227 - 32, 80, "Generations per second simulated.", primary_color, primary_color, primary_color, primary_color, 1);
					
					draw_rectangle_color(64 + 32, display_get_gui_height() - 224, 384 + 32, display_get_gui_height() - 192, secondary_color, secondary_color, secondary_color, secondary_color, false);
					draw_text_color(224 + 32, display_get_gui_height() - 208, "Show Game Info.", primary_color, primary_color, primary_color, primary_color, 1);
					
					draw_rectangle_color(64 + 72, display_get_gui_height() - 160, 384 + 72, display_get_gui_height() - 128, secondary_color, secondary_color, secondary_color, secondary_color, false);
					draw_text_color(224 + 72, display_get_gui_height() - 144, "Change game size.", primary_color, primary_color, primary_color, primary_color, 1);
					
					draw_rectangle_color(64 + 112, display_get_gui_height() - 96, 384 + 112, display_get_gui_height() - 64, secondary_color, secondary_color, secondary_color, secondary_color, false);
					draw_text_color(224 + 112, display_get_gui_height() - 80, "Highscore starting cells.", primary_color, primary_color, primary_color, primary_color, 1);
					
					draw_rectangle_color(display_get_gui_width() - 384 - 32, display_get_gui_height() - 96, display_get_gui_width() - 64 - 32, display_get_gui_height() - 64, secondary_color, secondary_color, secondary_color, secondary_color, false);
					draw_text_color(display_get_gui_width() - 256, display_get_gui_height() - 80, "Increase/Decrease Speed.", primary_color, primary_color, primary_color, primary_color, 1);

					draw_set_font(fn_default);
				}
				
				draw_set_halign(fa_left);
				draw_set_halign(fa_center);
		
			break;
	
			case "simulation":
				draw_text(display_get_gui_width()/2, y_margin, "Generations: " + string(generation_number));
			break;
	
			case "gameover":
				draw_text(display_get_gui_width()/2, y_margin, "Generations: " + string(generation_number));
				draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "Game Over!");
			break;
		}

		draw_set_halign(fa_right);
		draw_text(display_get_gui_width() - x_margin, y_margin, "Speed: " + string(settings.sim_speed));
		//draw_text(display_get_gui_width() - x_margin, display_get_gui_height() - font_get_size(fn_default), "[S]low - [F]ast");

		draw_set_halign(fa_left);
		draw_text(x_margin, y_margin, "Highscore: " + string(game_mode.highscore));

		draw_set_valign(fa_top);
		draw_set_color(c_white);
		
		//draw_sprite(spr_speed_up_black, 0, display_get_gui_width() - 96, display_get_gui_height() - 24);
	break;
}