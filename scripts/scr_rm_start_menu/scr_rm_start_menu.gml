function scr_rm_start_menu(){
	if keyboard_check_pressed(vk_space) || device_mouse_check_button_pressed(0, mb_left) {
		room_goto(rm_game);	
	}
}