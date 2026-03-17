/// @description declare damage_player function

event_inherited()

hp = 1
can_shoot = true

/// @function damage_player(obj,amount);
/// @description damages obj by amount
/// @param {Asset.GMObject} obj the object which will be damaged
/// @param {Real} amount the amount of hp which will be lost
damage_player = function(obj,amount){
	if(obj == obj_player){
		take_damage(obj,amount)
	}
}