
// button clicks

switch (button_id) {

	case 0: // Resume
		obj_pause_manager.paused = false
		obj_pause_manager.update_pause()
	break
	
	case 1: // Restart
	
	break
	
	case 2: // Quit
		game_end()
	break

}