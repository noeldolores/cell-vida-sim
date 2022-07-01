depth = 0;

settings = {
	cell_size : 16,
	sim_speed : 4,
	color : {
		//Pair 1
		black : {
			name : "black",
			primary: #000000,
			secondary: #FFFFFF,
			sprite : spr_cell_black
		},
		white : {
			name : "white",
			primary: #FFFFFF,
			secondary: #000000,
			sprite : spr_cell_white
		},
		//Pair 2
		cyan : {
			name : "cyan",
			primary: #1ECBE1,
			secondary: #E1341E,
			sprite : spr_cell_cyan
		},
		red_orange : {
			name : "red-orange",
			primary: #E1341E,
			secondary: #1ECBE1,
			sprite : spr_cell_red_orange
		},
		//Pair 3
		mint : {
			name : "mint",
			primary: #3EB489,
			secondary: #B43E69,
			sprite : spr_cell_mint
		},
		pink : {
			name : "pink",
			primary: #B43E69,
			secondary: #3EB489,
			sprite : spr_cell_pink
		},
		//Pair 4
		gold : {
			name : "gold",
			primary: #BDA842,
			secondary: #4257BD,
			sprite : spr_cell_gold
		},
		blue : {
			name : "blue",
			primary: #4257BD,
			secondary: #BDA842,
			sprite : spr_cell_blue
		}
	},
	small : {
		width : 320,
		height : 160,
		margin : 32,
		cell_count : 8,
		highscore : 0,
		highscore_grid : ds_grid_create(320/16, 160/16)
	},
	medium : {
		width : 640,
		height : 320,
		margin : 64,
		cell_count : 12,
		highscore : 0,
		highscore_grid : ds_grid_create(640/16, 320/16)
	},
	large : {
		width : 1280,
		height : 640,
		margin : 128,
		cell_count : 16,
		highscore : 0,
		highscore_grid : ds_grid_create(1280/16, 640/16)
	}
}

game_mode = settings.small;
scr_game_size_reset();

display_set_gui_size(1280,640);
draw_set_font(fn_default);

generation_number = 0;
grid_state_history = ds_list_create();
grid_outline_width = 1;

game_state = "placement"; //placement, simulation, history, gameover

display_highscore_cells = false;

debug_array = {
	show_neighbor_grid : false,
	show_cell_grid : false
}

color_scheme = settings.color.black;
primary_color = color_scheme.primary;
secondary_color = color_scheme.secondary;

scr_load_game();
color_scheme = scr_match_color_scheme_on_load(primary_color)

display_start_menu_text = true;