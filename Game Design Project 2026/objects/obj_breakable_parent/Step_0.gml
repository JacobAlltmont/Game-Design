
var player_touching = false

player_touching =
	place_meeting(x, y, obj_player_1) ||
	place_meeting(x - 1, y, obj_player_1) ||
	place_meeting(x + 1, y, obj_player_1) ||
	place_meeting(x, y - 1, obj_player_1) ||
	place_meeting(x, y + 1, obj_player_1)

if (!breaking) {
	
	if (!obj_pause_manager.paused) {
		
		if (player_touching) {
			
			if (keyboard_check_pressed(ord("E"))) {
				
				breaking = true
				break_timer = break_delay
				
			}
			
		}
		
	}
	
} else {
	
	if (break_timer > 0) {
		break_timer--
	} else {
		
		image_alpha -= fade_speed
		
		if (image_alpha <= 0) {
			instance_destroy()
		}
		
	}
	
}