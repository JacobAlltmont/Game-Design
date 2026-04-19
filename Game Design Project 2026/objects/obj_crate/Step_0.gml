
show_prompt = false

if (!obj_pause_manager.paused) {
	
	if (place_meeting(x, y, obj_player)) {
		show_prompt = true
	}
	
}

if (note_seen) {
	
	if (place_meeting(x, y, obj_player)) {
		
		if (!obj_pause_manager.paused) {
			
			if (keyboard_check_pressed(ord("F"))) {
				obj_pause_manager.open_crate()
			}
			
		}
		
	}
	
}