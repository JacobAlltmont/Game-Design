/// @description initialize hp to a higher value\

/// @type {Vector2}
dir = new Vector2(0,0)
spd = 1

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

hp = 10 //placeholder


//test
var test = new Vector2(0,0)
var test2 = new Vector2(0,-0.10)
var result = test.add(test)
show_debug_message("\n\n\nTest\n" + result.toString() + "\n\n\n")
