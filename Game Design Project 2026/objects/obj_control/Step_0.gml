/// @description TEST CODE

test = false //usually want this to be false

if test {
	if keyboard_check(ord("I")){
		gravityDirection = new Vector2(0,-1)
		show_debug_message("Set Gravity to (0,-1)")
	}else if keyboard_check(ord("K")){
		gravityDirection = new Vector2(0,1)
		show_debug_message("Set Gravity to (0,1)")
	}else if keyboard_check(ord("J")){
		gravityDirection = new Vector2(-1,0)
		show_debug_message("Set Gravity to (-1,0)")
	}else if keyboard_check(ord("L")){
		gravityDirection = new Vector2(1,0)
		show_debug_message("Set Gravity to (1,0)")
	}else if keyboard_check(ord("O")){
		gravityDirection = new Vector2(0,0)
		show_debug_message("Set Gravity to (0,0)")
	}
}