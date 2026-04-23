// @description move the player based on input

getInput = function(v){
	if inputs == pointer_null return false
	for (var i = 0; i < 4; i++){
		if directions[i].equals(v) return inputs[i]
	}
	return false
}

// keys for attacks
var keyBasicAttack = keyboard_check_pressed(ord("Q"))
var keyPowerSwing = keyboard_check_pressed(ord("E"))
var keyUltimateAttack = keyboard_check_pressed(ord("R"))

// cooldowns for attacks
if (powerSwingCooldown > 0) powerSwingCooldown--
if (ultimateAttackCooldown > 0) ultimateAttackCooldown--

if (hurtFlashTimer > 0) { // player flashes red when taking damage
	
	hurtFlashTimer--
	image_blend = c_red
	
} else {
	
	image_blend = c_white
	
}

if (state == PLAYERSTATE.ATTACK) {
	
	PlayerState_Attack()
	return
	
}

gravD = obj_control.gravityDirection
gravM = obj_control.gravityMagnitude

jumpSpeed = 2 / gravM

inputs = [
	keyboard_check(vk_left) or keyboard_check(ord("A")),	//0: left
	keyboard_check(vk_right) or keyboard_check(ord("D")),	//1: right
	keyboard_check(vk_up) or keyboard_check(ord("W")),		//2: up
	keyboard_check(vk_down) or keyboard_check(ord("S")),	//3: down
	keyboard_check(vk_space)								//4: jump
]

if (gravD.x == 0 and gravD.y == 0){ // zero gravity
	// if you are touching a surface, you can jump  away from the surface
	// by pressing the space key
	var onSurface = false
	var jumpMultiplier = 1.2
	for (var i = 0; i < 4; i++){ // go through each direction and check if there is a surface
		var vector = directions[i]
		if place_meeting(x + vector.x,y + vector.y,collisionBlocks){
			if !onSurface{ // if this is the first surface we find, set dir to 0,0
				//TODO: fix the bug with this line
				//image_angle = vector.angleDegrees(new Vector2(0,1))
				dir = new Vector2(0,0)
				onSurface = true
			}
			for (var j = 0; j < 4; j++){
				var vectorj = directions[j]
				if !getInput(vectorj) continue
				switch vector.cross(vectorj){
				case 0: // parallel or perpendicular
					if !inputs[4] continue //if we are not jumping don't do anything
					if vectorj.equals(vector) { //same
						jumpMultiplier *= 0.75
					}else{ //opposite
						jumpMultiplier *= 1.5
					}
					break;
				case 1: //slide along the surface
				case -1://if we are jumping this will affect direction
					dir.iadd(vectorj) 
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
		//image_angle = dir.angleDegrees(new Vector2(0,-1))
	}
}
else{ // normal gravity
	
	// move the player horixontally (relative to the gravity)
	// determine which input should be jump
	// set the image angle depending on the gravity
	if gravD.x == 0 { //gravity is vertical
		dir.x = (inputs[1] ? 1 : 0) - (inputs[0] ? 1 : 0) //move horizontally 
		if gravD.y == 1 { // down
			image_angle = 0
		}else if gravD.y == -1 { // up
			image_angle = 180
		}
	} else if gravD.y == 0 { // if gravity is horizontal
		dir.y = (inputs[3] ? 1 : 0) - (inputs[2] ? 1 : 0) //move vertically
		if gravD.x == 1 { // right
			image_angle = 90
		}else if gravD.x == -1 { // left
			image_angle = 270
		}
	}
	
	// make the player face the direction they are going
	var result = dir.cross(gravD)
	if result != 0 {
		image_xscale = result * scale
	}

	//jump
	if place_meeting(x + gravD.x,y + gravD.y,collisionBlocks){ //only jump if standing on a block
		//could maybe multiply by absolute value of inverse or something here too
		//if on the surface make the sprite sIdle
		if gravD.x == 0 { // if gravity is vertical
			dir.y = 0
			sprite_index = spr_player_idle
			 if dir.x != 0 {
				 sprite_index = spr_player_walk
			 }
		} else if gravD.y == 0 { //if gravity is horizontal
			dir.x = 0
			sprite_index = spr_player_idle
			 if dir.y != 0 {
				 sprite_index = spr_player_walk
			 }
		}
		// make the player jump
		if (inputs[4]){ //jump up
			dir.iadd(gravD.mul(-jumpSpeed))
			sprite_index = spr_player_jump
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

// ladder climbing 
if (place_meeting(x, y, obj_ladder)) {
    if (gravD.y != 0) dir.y = 0; 
    if (gravD.x != 0) dir.x = 0;
    
    // vertical movement
    if inputs[2] {
        dir.y -= 1;
    }
	if inputs[3] {
        dir.y += 1;
    }
}

//move player
move_and_collide(dir.x,dir.y,collisionBlocks)

//check if the hitbox is clipping at all, and if it is, move it out
var tempDir
for (var i = 0; i < 4; i++){
	tempDir = directions[i]
	//if the player is in the wall, move it away one pixel at a time
	while place_meeting(x + tempDir.x, y + tempDir.y, collisionBlocks)
		and !place_meeting(x - tempDir.x, y - tempDir.y, collisionBlocks) {
		x -= tempDir.x
		y -= tempDir.y
	}
	//move it back one so it is against the wall (but not in it)
	x += tempDir.x
	y += tempDir.y
}

//if player off screen, kill player and reset
if	(x > room_width + abs(sprite_width)) ||
	(x < -abs(sprite_width)) ||
	(y > room_height + abs(sprite_height)) ||
	(y < -abs(sprite_height)) {
		reset()
	}

//Placeholder until we figure out when and where the game ends
if hp > 0 {
	global.score -= .001
	if global.gem_multiplier == 0{
		global.gem_multiplier += 1
	} else {
		global.gem_multiplier = global.gems_collected
	}
	
	//show_debug_message(global.score*global.gem_multiplier);
}

// manage player state
if (keyBasicAttack) {
	
	attackType = PLAYERATTACK.BASIC
	state = PLAYERSTATE.ATTACK
	
} else if (keyPowerSwing && powerSwingCooldown <= 0) {
	
	attackType = PLAYERATTACK.POWER
	powerSwingCooldown = 300
	state = PLAYERSTATE.ATTACK
	
} else if (keyUltimateAttack && ultimateAttackCooldown <= 0) {
	
	attackType = PLAYERATTACK.ULTIMATE
	ultimateAttackCooldown = 1000
	state = PLAYERSTATE.ATTACK
	
}
