// @desct move the player based on input

xSpeed = 0
ySpeed += 0.1// * obj_control.gravityMagnitude

if (keyboard_check(vk_left) or keyboard_check(ord("A"))){
	xSpeed = -1	
}

if (keyboard_check(vk_right) or keyboard_check(ord("D"))){
	xSpeed = 1
}

//if on the ground, freeze y movement and allow jumps
if place_meeting(x,y + 1,abstract_block){
	ySpeed = 0 
	if (keyboard_check(vk_up) or keyboard_check(ord("W"))){ //jump up
		ySpeed = -2
	//} else if (keyboard_check(vk_down) or keyboard_check(ord("S"))){
	//	//half jump
	//	ySpeed = -1	
	}
}

move_and_collide(xSpeed,ySpeed,abstract_block)

/// TODO: change this for variable gravity

