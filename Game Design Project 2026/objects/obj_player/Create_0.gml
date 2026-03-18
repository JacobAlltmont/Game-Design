/// @description initialize hp and speed

/// @type {Vector2}
dir = new Vector2(0,0)
spd = 1 // speed constant
collisionBlocks = [abstract_block,layer_tilemap_get_id(layer_get_id("Ground"))]
directions = [
	new Vector2(0,1),
	new Vector2(0,-1),
	new Vector2(1,0),
	new Vector2(-1,0)
]

//facing_right = true

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

hp = 10 //placeholder

