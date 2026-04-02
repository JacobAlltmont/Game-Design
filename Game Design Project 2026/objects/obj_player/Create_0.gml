/// @description initialize hp and speed

/// @type {Vector2}
dir = new Vector2(0,0)
collisionBlocks = [abstract_block,layer_tilemap_get_id(layer_get_id("Ground"))]
directions = pointer_null
inputs = pointer_null

//facing_right = true

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

hp = 10 //placeholder

