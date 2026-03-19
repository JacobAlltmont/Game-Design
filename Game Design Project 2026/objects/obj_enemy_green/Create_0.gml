/// @description Initialize AI, physics, and vectors

// Vector
dir = new Vector2(0,0);
spd = 1; 
collisionBlocks = [abstract_block, layer_tilemap_get_id(layer_get_id("Ground"))];


directions = [
    new Vector2(0, 1),  // 0: Down
    new Vector2(0, -1), // 1: Up
    new Vector2(1, 0),  // 2: Right
    new Vector2(-1, 0)  // 3: Left
];

move_dir = 1;        
hp = 1;              
can_move = true;  