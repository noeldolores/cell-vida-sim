switch(room) {
	case rm_start_menu:
		
	break;
	
	case rm_game:
		var _bottom_button_y = display_get_gui_height() - 28
		
		instance_create_layer(76, _bottom_button_y, "Instances", obj_button_info);
		instance_create_layer(116, _bottom_button_y, "Instances", obj_button_grid_size);
		instance_create_layer(156, _bottom_button_y, "Instances", obj_button_highscore_start);
		instance_create_layer(display_get_gui_width()/2, _bottom_button_y, "Instances", obj_button_start);
		
		instance_create_layer(116, _bottom_button_y, "Instances", obj_button_restart);
		instance_create_layer(156, _bottom_button_y, "Instances", obj_button_previous_start);
		
		instance_create_layer(display_get_gui_width() - 116, _bottom_button_y, "Instances", obj_button_slow_down);
		instance_create_layer(display_get_gui_width() - 76, _bottom_button_y, "Instances", obj_button_speed_up);
		
	break;
}