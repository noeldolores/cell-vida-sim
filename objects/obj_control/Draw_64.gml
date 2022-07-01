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
			draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "Press [Space] to Start");
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
				draw_text(display_get_gui_width()/2, y_margin, "Cells Remaining: " + string(game_mode.cell_count - instance_number(par_cell)));
				if instance_number(par_cell) == game_mode.cell_count {
					draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "[Space] to Start");
				} else {
					draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "[D]isplay Highscore Layout");	
				}
				draw_set_halign(fa_left);
				draw_text(x_margin, display_get_gui_height() - font_get_size(fn_default), "[G]ame Size");
				
				draw_set_halign(fa_center);
		
			break;
	
			case "simulation":
				draw_text(display_get_gui_width()/2, y_margin, "Generations: " + string(generation_number));
			break;
	
			case "gameover":
				draw_text(display_get_gui_width()/2, y_margin, "Generations: " + string(generation_number));
				draw_text(display_get_gui_width()/2, display_get_gui_height() - font_get_size(fn_default), "[R]estart");
			break;
		}

		draw_set_halign(fa_right);
		draw_text(display_get_gui_width() - x_margin, y_margin, "Speed: " + string(settings.sim_speed));
		draw_text(display_get_gui_width() - x_margin, display_get_gui_height() - font_get_size(fn_default), "[S]low - [F]ast");

		draw_set_halign(fa_left);
		draw_text(x_margin, y_margin, "Highscore: " + string(game_mode.highscore));

		draw_set_valign(fa_top);
		draw_set_color(c_white);
	break;
}