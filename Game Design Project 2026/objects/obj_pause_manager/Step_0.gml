
if (keyboard_check_pressed(vk_escape)) {

	if (!paused) {
		
		open_pause()
		
	} else {
		
		close_ui()
		
	}

}