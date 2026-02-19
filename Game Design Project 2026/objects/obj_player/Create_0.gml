/// @description initialize hp to a higher value\

xSpeed = 0
ySpeed = 0

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

hp = 10 //placeholder

