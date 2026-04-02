/// @description Initialize enemy

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
          
dmg = 1;
can_move = true;  

damage_player = function(obj,amount){
	if(obj == obj_player){
		take_damage(obj,amount)
		
	}
}

take_damage = function(obj,amount) {
	if (variable_instance_exists(obj, obj.hp)) {
		obj.hp -= amount
		show_debug_message("player damage")
		show_debug_message(other.hp)
		if(obj.hp <= 0){
			obj.instance_destroy(true)
		}
	}
}
