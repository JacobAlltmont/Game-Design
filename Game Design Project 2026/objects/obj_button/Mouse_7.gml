
// button clicks

switch (button_id) {

	case 0: // Resume
		obj_pause_manager.close_ui()
	break
	
	case 1: // Restart
		game_restart()
	break
	
	case 2: // Quit
		game_end()
	break
	
	case 3: // Tutorial
		obj_pause_manager.open_tutorial()
	break
	
	case 4: // Back
		obj_pause_manager.open_pause()
	break

}