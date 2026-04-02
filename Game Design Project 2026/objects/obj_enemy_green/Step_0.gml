gravD = obj_control.gravityDirection;
gravM = obj_control.gravityMagnitude;

var move_x = 0;
var move_y = 0;

if (gravD.x == 0) { 
    // Vertical Gravity
    move_x = move_dir;
} else if (gravD.y == 0) { 
    // Horizontal Gravity
    move_y = move_dir;
}

var collision_check = (move_dir == 1) ? bbox_right : bbox_left;

// wall collision 
if (place_meeting(collision_check + move_dir, y , collisionBlocks)) {
    move_dir *= -1; 
}

dir.x = move_x;
dir.y = move_y;

// animation
var result = dir.cross(gravD);
if (result != 0) {
    image_xscale = result;
}

if (dir.x != 0 || dir.y != 0) {
    sprite_index = sAlien_run;
} else {
    sprite_index = sAlien_idle;
}




dir.imul(spd);
dir.iadd(gravD.mul(0.1 * gravM)); 


move_and_collide(dir.x, dir.y, collisionBlocks);