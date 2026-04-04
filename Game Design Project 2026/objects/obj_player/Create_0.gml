/// @description initialize hp and speed

/// @type {Vector2}
dir = new Vector2(0,0)
spd = 1 // speed constant
collisionBlocks = [abstract_block,layer_tilemap_get_id(layer_get_id("Ground"))]
directions = pointer_null
inputs = pointer_null

isPlayer = true

//facing_right = true

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

/// @function damage_enemy(obj,amount);
/// @description damages obj by amount
/// @param {Asset.GMObject} obj the object which will be damaged
/// @param {Real} amount the amount of hp which will be lost
damage_player = function(obj,amount){
	if(obj == abstract_enemy){
		take_damage(obj,amount)
	}
}

hp = 100 //placeholder

