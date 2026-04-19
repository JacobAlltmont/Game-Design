
if (!breaking) {
	
	var player_touching =
		place_meeting(x, y, obj_player) ||
		place_meeting(x - 10, y, obj_player) ||
		place_meeting(x + 10, y, obj_player) ||
		place_meeting(x, y - 10, obj_player) ||
		place_meeting(x, y + 10, obj_player)
	
	if player_touching{show_debug_message("player is touching a breakable")}

	
	if (!obj_pause_manager.paused) {
		
		if (player_touching) {
			
			if (obj_player.sprite_index == spr_player_power_swing) {
				
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