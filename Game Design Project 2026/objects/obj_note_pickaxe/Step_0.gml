
if (note_seen) {
	
	if (place_meeting(x, y, obj_player_1)) {
		
		if (!obj_pause_manager.paused) {
			
			if (keyboard_check_pressed(ord("F"))) {
				obj_pause_manager.open_pickaxe()
			}
			
		}
		
	}
	
}