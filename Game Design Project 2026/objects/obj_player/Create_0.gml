/// @description initialize hp to a higher value\

/// @type {Vector2}
dir = new Vector2(0,0)
spd = 1 // speed constant

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

hp = 10 //placeholder

