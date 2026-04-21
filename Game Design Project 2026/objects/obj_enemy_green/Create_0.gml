/// @description Initialize enemy

event_inherited()

// Vector
dir = new Vector2(0,0);
spd = 0.5; 
collisionBlocks = [abstract_block, layer_tilemap_get_id(layer_get_id("Ground"))];


directions = [
    new Vector2(0, 1),  // 0: Down
    new Vector2(0, -1), // 1: Up
    new Vector2(1, 0),  // 2: Right
    new Vector2(-1, 0)  // 3: Left
];

move_dir = -1;        
hp = 2          
dmg = 1;
reverseRate = 20
reverseCooldown = reverseRate
hitRate = 1 * game_get_speed(gamespeed_fps)
hitCooldown = 0
can_move = true;  
