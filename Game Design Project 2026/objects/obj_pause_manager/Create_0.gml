
paused = false

layer_name = "PauseLayer"

update_pause = function() {
	
	layer_set_visible("PauseLayer", false)
	layer_set_visible("NoteLayer", false)
	
	if (paused) {
		
		instance_deactivate_all(true)
		layer_set_visible(layer_name, true)
		
	} else {
		
		instance_activate_all()
		
	}
	
}

open_pause = function() {
	
	layer_name = "PauseLayer"
	paused = true
	update_pause()
	
}

open_note = function() {
	
	layer_name = "NoteLayer"
	paused = true
	update_pause()
	
}

close_ui = function() {
	
	paused = false
	layer_name = "PauseLayer"
	update_pause()
	
}

update_pause()