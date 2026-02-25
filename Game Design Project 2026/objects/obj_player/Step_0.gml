// @description move the player based on input

jumpSpeed = 2 / obj_control.gravityMagnitude

inputs = [
	keyboard_check(vk_left) or keyboard_check(ord("A")),	//0: left
	keyboard_check(vk_right) or keyboard_check(ord("D")),	//1: right
	keyboard_check(vk_up) or keyboard_check(ord("W")),		//2: up
	keyboard_check(vk_down) or keyboard_check(ord("S")),	//3: down
]

if (obj_control.gravityMagnitude == 0){
	// whatever we decide for zero gravity
}else{
	if obj_control.gravityDirection.x == 0 {
		dir.x = (inputs[1] ? 1 : 0) - (inputs[0] ? 1 : 0) //move left or right
		
		if obj_control.gravityDirection.y == 1 { // down
			show_debug_message("down")
			if place_meeting(x,y + 1,abstract_block){ //only jump if on a block
				dir.y = 0 
				if (inputs[2]){ //jump up
					dir.y = -jumpSpeed
				}
			}
			
		}else if obj_control.gravityDirection.y == -1 { // up
			show_debug_message("up")
			if place_meeting(x,y - 1,abstract_block){
				dir.y = 0 
				if (inputs[3]){
					dir.y = jumpSpeed
				}
			}
		}
	}else if obj_control.gravityDirection.y == 0 {
		dir.y = (inputs[3] ? 1 : 0) - (inputs[2] ? 1 : 0)
		if obj_control.gravityDirection.x == 1 { // right
			show_debug_message("right")
			
			if place_meeting(x + 1,y,abstract_block){
				dir.x = 0 
				if (inputs[0]){
					dir.x = -jumpSpeed
				}
			}
		}else if obj_control.gravityDirection.x == -1 { //left
			show_debug_message("left")
			if place_meeting(x - 1,y,abstract_block){
				dir.x = 0 
				if (inputs[1]){
					dir.x = jumpSpeed
				}
			}
		}
	}
}

//show_debug_message("1: " + dir.toString())

dir.imul(spd)

//show_debug_message("2: " + dir.toString())

var grav = obj_control.gravityDirection.clone()
grav.imul(0.1 * obj_control.gravityMagnitude)

dir.iadd(grav)

//show_debug_message("3: " + dir.toString())

move_and_collide(dir.x,dir.y,abstract_block)


