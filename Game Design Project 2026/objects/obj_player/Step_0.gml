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
	jumpIdx = 0 //which input will jump
	if gravD.x == 0 {
		dir.x = (inputs[1] ? 1 : 0) - (inputs[0] ? 1 : 0) //move left or right
		if gravD.y == 1 { // down
			image_angle = 0
			jumpIdx = 2
		}else if gravD.y == -1 { // up
			image_angle = 180
			jumpIdx = 3
		}else {
			show_debug_message("invalid gravity direction" + gravD.toString())
		}
	} else if gravD.y == 0 {
		dir.y = (inputs[3] ? 1 : 0) - (inputs[2] ? 1 : 0)
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
	if place_meeting(x + gravD.x,y + gravD.y,abstract_block){ //only jump if on a block
		//could maybe multiply by absolute value of inverse or something here too
		if gravD.x == 0 {
			dir.y = 0
			sprite_index = sIdle
		}
		if gravD.y == 0 {
			dir.x = 0
			sprite_index = sIdle
		}
		if (inputs[jumpIdx]){ //jump up
			dir.iadd(gravD.mul(-jumpSpeed))
			sprite_index = sJump
		}
	}
}

dir.imul(spd)

var grav = gravD.clone()
grav.imul(0.1 * gravM)

dir.iadd(grav)

move_and_collide(dir.x,dir.y,abstract_block)


