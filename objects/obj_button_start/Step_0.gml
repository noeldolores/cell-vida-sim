if obj_control.game_state == "placement" {
	var _num_cell = instance_number(par_cell);
	if _num_cell == obj_control.game_mode.cell_count {
		image_alpha = 1;	
	} else {
		image_alpha = 0;	
	}
	
} else {
	image_alpha = 0;	
}