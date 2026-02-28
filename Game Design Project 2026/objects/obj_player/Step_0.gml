// @description move the player based on input

gravD = obj_control.gravityDirection
gravM = obj_control.gravityMagnitude

jumpSpeed = 2 / gravM

inputs = [
	keyboard_check(vk_left) or keyboard_check(ord("A")),	//0: left
	keyboard_check(vk_right) or keyboard_check(ord("D")),	//1: right
	keyboard_check(vk_up) or keyboard_check(ord("W")),		//2: up
	keyboard_check(vk_down) or keyboard_check(ord("S")),	//3: down
]

if (gravM == 0){
	// whatever we decide for zero gravity
}else{
	jumpIdx = 2 //up by default 
	
	// move the player horixontally (relative to the gravity)
	// determine which input should be jump
	// set the image angle depending on the gravity
	if gravD.x == 0 { //gravity is vertical
		dir.x = (inputs[1] ? 1 : 0) - (inputs[0] ? 1 : 0) //move horizontally 
		if gravD.y == 1 { // down
			image_angle = 0
			jumpIdx = 2
		}else if gravD.y == -1 { // up
			image_angle = 180
			jumpIdx = 3
		}else {
			show_debug_message("invalid gravity direction" + gravD.toString())
		}
	} else if gravD.y == 0 { // if gravity is horizontal
		dir.y = (inputs[3] ? 1 : 0) - (inputs[2] ? 1 : 0) //move vertically
		if gravD.x == 1 { // right
			image_angle = 90
			jumpIdx = 0
		}else if gravD.x == -1 { // left
			image_angle = 270
			jumpIdx = 1
		}else {
			show_debug_message("invalid gravity direction" + gravD.toString())
		}
	}
	
	// make the player face the direction they are going
	var result = dir.cross(gravD)
	if result != 0 {
		image_xscale = result
	}

	//jump
	if place_meeting(x + gravD.x,y + gravD.y,abstract_block){ //only jump if standing on a block
		//could maybe multiply by absolute value of inverse or something here too
		//if on the surface make the sprite sIdle
		if gravD.x == 0 { // if gravity is vertical
			dir.y = 0
			sprite_index = sIdle
			// if dir.x != 0 {run sprite}
		} else if gravD.y == 0 { //if gravity is horizontal
			dir.x = 0
			sprite_index = sIdle
			// if dir.y != 0 {run sprite}
		}
		
		
		// make the player jump
		if (inputs[jumpIdx]){ //jump up
			dir.iadd(gravD.mul(-jumpSpeed))
			sprite_index = sJump
		}
	}
	
	//if the player's head hit's a block, make sure they don't stick
	if place_meeting(x - gravD.x, y - gravD.y,abstract_block){ //if there is a block above
		if dir.dot(gravD.mul(-1)) > 0 { //if heading into the block
			//set vertical speed to zero
			if gravD.x == 0 {
				dir.y = 0
			} else if gravD.y == 0 {
				dir.x = 0
			}
		}
	}
}

//speed multiplier if we want to use it
dir.imul(spd)

// apply gravity
dir.iadd(gravD.mul(0.1 * gravM))

//move player
move_and_collide(dir.x,dir.y,abstract_block)


