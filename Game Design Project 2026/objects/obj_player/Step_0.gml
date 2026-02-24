// @desct move the player based on input

//xSpeed = 0
//ySpeed += 0.1 * obj_control.gravityMagnitude

jumpSpeed = 2 * obj_control.gravityMagnitude

dir.x = 0

inputs = [
	keyboard_check(vk_left) or keyboard_check(ord("A")),	//0: left
	keyboard_check(vk_right) or keyboard_check(ord("D")),	//1: right
	keyboard_check(vk_up) or keyboard_check(ord("W")),		//2: up
	keyboard_check(vk_down) or keyboard_check(ord("S")),	//3: down
]

if (obj_control.gravityMagnitude == 0){
	// whatever we decide for zero gravity
}else{
	switch (obj_control.gravityDirection.toArray()){
	case [0,1]: //down
		dir.x += (inputs[1] ? 1 : 0) - (inputs[0] ? 1 : 0) //move left or right
		if place_meeting(x,y + 1,abstract_block){ //only jump if on a block
			dir.y = 0 
			if (inputs[3]){ //jump up
				dir.y = -jumpSpeed
			}
		}
		break
	case [0,-1]: //up
		dir.x += (inputs[1] ? 1 : 0) - (inputs[0] ? 1 : 0)
		if place_meeting(x,y - 1,abstract_block){
			dir.y = 0 
			if (inputs[2]){
				dir.y = jumpSpeed
			}
		}
		break
	case [1,0]: //right
		dir.y += (inputs[3] ? 1 : 0) - (inputs[2] ? 1 : 0)
		if place_meeting(x + 1,y,abstract_block){
			dir.x = 0 
			if (inputs[0]){
				dir.x = -jumpSpeed
			}
		}
		break
	case[-1,0]: //left
		dir.y += (inputs[3] ? 1 : 0) - (inputs[2] ? 1 : 0)
		if place_meeting(x + 1,y,abstract_block){
			dir.x = 0 
			if (inputs[1]){
				dir.x = jumpSpeed
			}
		}
		break
	}
}

//switch (obj_control.gravityDirection.x){	
//	case 0:
//		dir.x += inputs[0] ? 1 : 0
//		dir.x -= inputs[1] ? 1 : 0
//		break;
//	case 1:
//		dir.x += inputs[1] ? jumpSpeed : (inputs[0] ? jumpSpeed / 2 : 0)
//		break;
//	case -1: 
//		dir.x -= inputs[0] ? jumpSpeed : (inputs[1] ? jumpSpeed / 2 : 0)
//		break;
//	default:
//	//error
//}

//switch (obj_control.gravityDirection.y){
//	case 0:
//		dir.y += inputs[3]
//		dir.y -= inputs[2]
//		break;
//	case 1: 
//		dir.y += inputs[3] ? jumpSpeed : (inputs[2] ? jumpSpeed / 2 : 0)
//		break;
//	case -1: 
//		dir.y -= inputs[2] ? jumpSpeed : (inputs[3] ? jumpSpeed / 2 : 0)
//		break;
//	default:
//	//error
//}
	
dir.scale(spd)

dir.add(obj_control.gravityDirection.scale(0.1))


//if (keyboard_check(vk_left) or keyboard_check(ord("A"))){
//	xSpeed = -1	
//}

//if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
//	xSpeed = 1
//}

////if on the ground, freeze y movement and allow jumps
//if place_meeting(x,y + 1,abstract_block){
//	ySpeed = 0 
//	if (keyboard_check(vk_up) or keyboard_check(ord("W"))){ //jump up
//		ySpeed = -2
//	//} else if (keyboard_check(vk_down) or keyboard_check(ord("S"))){
//	//	//half jump
//	//	ySpeed = -1	
//	}
//}

////note: if this runs every frame, sometimes the player sticks to the top
////since it runs in consecutive frames
////when the momentum is fully inverted it's fast enough to get out of it but watch for this later
//if place_meeting(x,y - 1,abstract_block){
//	ySpeed *= -1
//}

move_and_collide(dir.x,dir.y,abstract_block)

/// TODO: change this for variable gravity

