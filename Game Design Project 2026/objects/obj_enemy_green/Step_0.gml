
reverseCooldown--
hitCooldown--

gravD = obj_control.gravityDirection;
gravM = obj_control.gravityMagnitude;

dir = new Vector2(0,0)

if (gravD.x == 0) { 
    // Vertical Gravity
    dir.x = move_dir;
} else if (gravD.y == 0) { 
    // Horizontal Gravity
    dir.y = move_dir;
}


//var collision_check = (move_dir == 1) ? bbox_right : bbox_left;

// wall collision 

var temp = dir.mul(5)
if ((place_meeting(x + temp.x, y + temp.y, collisionBlocks)) ||  // if it runs into a wall
	(!place_meeting(x + temp.x + gravD.x, y + temp.y + gravD.y, collisionBlocks))) && // or it finds a cliff
	reverseCooldown <= 0 { //and it can switch
		reverseCooldown = reverseRate
		//show_debug_message(new Vector2(x,y).toString())
		//show_debug_message(dir.toString())
		move_dir *= -1;
		dir.imul(-1)
}

// animation
var result = dir.cross(gravD);
if (result != 0) {
    image_xscale = sign(result);
}

while place_meeting(x - dir.x, y - dir.y, collisionBlocks){
	x += dir.x
	y += dir.y
}

if (dir.x != 0 || dir.y != 0) {
    sprite_index = sAlien_run;
} else {
    sprite_index = sAlien_idle;
}


if hp <= 0{
	instance_destroy(id, true)
	global.score += 10
}



dir.imul(spd);
dir.iadd(gravD.mul(gravM)); 


move_and_collide(dir.x, dir.y, collisionBlocks);

