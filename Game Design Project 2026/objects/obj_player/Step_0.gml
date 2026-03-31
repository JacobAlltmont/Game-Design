// @description move the player based on input

getInput = function(v){
	if directions == pointer_null return false
	if inputs == pointer_null return false
	for (var i = 0; i < 4; i++){
		if directions[i].equals(v) return inputs[i]
	}
	return false
}

gravD = obj_control.gravityDirection
gravM = obj_control.gravityMagnitude

jumpSpeed = 2 / gravM

inputs = [
	keyboard_check(vk_left) or keyboard_check(ord("A")),	//0: left
	keyboard_check(vk_right) or keyboard_check(ord("D")),	//1: right
	keyboard_check(vk_up) or keyboard_check(ord("W")),		//2: up
	keyboard_check(vk_down) or keyboard_check(ord("S")),	//3: down
	keyboard_check(vk_space)								//4: jump (zero g only)
]
if directions == pointer_null {
	directions = [
		new Vector2(-1,0),	//left
		new Vector2(1,0),	//right
		new Vector2(0,-1),	//up
		new Vector2(0,1)	//down
	]
}

if (gravD.x == 0 and gravD.y == 0){ // zero gravity
	// if you are touching a surface, you can jump  away from the surface
	// by pressing the space key
	var onSurface = false
	var jumpMultiplier = 1.2
	for (var i = 0; i < 4; i++){ // go through each direction and check if there is a surface
		var vector = directions[i]
		if place_meeting(x + vector.x,y + vector.y,collisionBlocks){
			//make player have their feet on the wall
			if !onSurface{ // if this is the first surface we find, set dir to 0,0
				dir = new Vector2(0,0)
			}
			onSurface = true
			for (var j = 0; j < 4; j++){
				if !getInput(directions[j]) continue
				switch vector.cross(directions[j]){
				case 0: // parallel or perpendicular
					if !inputs[4] continue //if we are not jumping don't do anything
					if directions[j].equals(vector) { //same
						jumpMultiplier *= 0.75
					}else{ //opposite
						jumpMultiplier *= 1.5
					}
					break;
				case 1: //slide along the surface
				case -1://if we are jumping this will affect direction
					dir.iadd(directions[j]) 
					break;
				}
				
			}
			if inputs[4]{
				dir.iadd(vector.mul(-1))
			}
		}
	}
	if onSurface { // if you were on a surface apply the jump multiplier now
		dir.imul(jumpMultiplier)
	} else { // if you are in the air, accelerate with a jetpack
		//if you are in the air, your jetpack will accelerate you
		//depending on input
		//may also want a topSpeed variable so it doesn't go too fast
		acceleration = 0.05
		topSpeed = 3
		dir.x -= inputs[0] ? acceleration : 0
		dir.x += inputs[1] ? acceleration : 0
		dir.y -= inputs[2] ? acceleration : 0
		dir.y += inputs[3] ? acceleration : 0
		if dir.length() > topSpeed{
			dir = dir.normalize().mul(topSpeed)
		}
		//make them face the direction they are facing
	}
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
	if place_meeting(x + gravD.x,y + gravD.y,collisionBlocks){ //only jump if standing on a block
		//could maybe multiply by absolute value of inverse or something here too
		//if on the surface make the sprite sIdle
		if gravD.x == 0 { // if gravity is vertical
			dir.y = 0
			sprite_index = sIdle
			 if dir.x != 0 {
				 sprite_index = sRun
			 }
		} else if gravD.y == 0 { //if gravity is horizontal
			dir.x = 0
			sprite_index = sIdle
			 if dir.y != 0 {
				 sprite_index = sRun
			 }
		}
		// make the player jump
		if (inputs[jumpIdx]){ //jump up
			dir.iadd(gravD.mul(-jumpSpeed))
			sprite_index = sJump
		}
	}
	
	//if the player's head hit's a block, make sure they don't stick
	if place_meeting(x - gravD.x, y - gravD.y,collisionBlocks){ //if there is a block above
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
move_and_collide(dir.x,dir.y,collisionBlocks)

