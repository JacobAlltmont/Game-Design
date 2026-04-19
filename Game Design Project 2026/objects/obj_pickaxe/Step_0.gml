
show_prompt = false

if (!picked_up) {
	
	if (!obj_pause_manager.paused) {
		
		if (place_meeting(x, y, obj_player)) {
			
			show_prompt = true
			
			if (keyboard_check_pressed(ord("F"))) {
				picked_up = true
				show_prompt = false
			}
			
		}
		
	}
	
} else {
	
	image_alpha -= fade_speed
	
	if (image_alpha <= 0) {
		instance_destroy()
	}
	
}