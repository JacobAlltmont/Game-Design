
gravD = obj_control.gravityDirection;
gravM = obj_control.gravityMagnitude;
jumpSpeed = 2 / gravM;

inputs = [
    keyboard_check(vk_left)  || keyboard_check(ord("A")), // 0: left
    keyboard_check(vk_right) || keyboard_check(ord("D")), // 1: right
    keyboard_check(vk_up)    || keyboard_check(ord("W")), // 2: up
    keyboard_check(vk_down)  || keyboard_check(ord("S"))  // 3: down
];

var walkD = 0;
jumpIdx = 0;

if (gravM == 0) {
    // Zero-G Logic eventually 
} else {
    // Determine movement axis and rotation based on Gravity Direction
    if (gravD.x == 0) { // Vertical Gravity 
        walkD = inputs[1] - inputs[0]; // Move on X axis
        if (gravD.y == 1) { image_angle = 0;   jumpIdx = 2; } // Down
        else              { image_angle = 180; jumpIdx = 3; } // Up
    } else if (gravD.y == 0) { // Horizontal Gravity 
        walkD = inputs[3] - inputs[2]; // Move on Y axis
        if (gravD.x == 1) { image_angle = 90;  jumpIdx = 0; } // Right
        else              { image_angle = 270; jumpIdx = 1; } // Left
    }
}


var isGrounded = place_meeting(x + gravD.x, y + gravD.y, abstract_block);

if (isGrounded) {
    // stops falling
    if (gravD.x != 0) dir.x = 0;
    if (gravD.y != 0) dir.y = 0;

    // run/idle 
    if (walkD != 0) {
        sprite_index = sRun;
    } else {
        sprite_index = sIdle;
    }

    // Jumping
    if (inputs[jumpIdx]) {
        // Apply jump 
        dir.x = -gravD.x * jumpSpeed;
        dir.y = -gravD.y * jumpSpeed;
        
        sprite_index = sJump;
        
        // put the player 2 pixels off the floor 
        // prevents the grounded check from resetting velocity to 0 on the next frame
        x -= gravD.x * 2;
        y -= gravD.y * 2;
    }
} else {
    
    sprite_index = sJump;
}


// Apply walking speed to the axis not affected by gravity
if (gravD.x == 0) dir.x = walkD * spd;
if (gravD.y == 0) dir.y = walkD * spd;

// Gravity Acceleration
dir.x += gravD.x * (0.1 * gravM);
dir.y += gravD.y * (0.1 * gravM);

// Face the direction of movement using cross product
var result = dir.cross(gravD);
if (result != 0) {
    image_xscale = result;
}

move_and_collide(dir.x, dir.y, abstract_block);