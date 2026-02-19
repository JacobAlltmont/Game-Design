/// @description declare damage_obj function

event_inherited()

hp = 1

damage_player = function(obj,amount){
	if(obj == obj_player){
		take_damage(obj,amount)
	}
}