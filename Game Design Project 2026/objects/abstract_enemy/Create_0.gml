/// @description declare damage_player function


hp = 1

take_damage = function(amount) {
	//show_debug_message("hp was " + string(hp) + ", damage is " + string(amount))
	hp -= amount
	if(hp <= 0){
		//show_debug_message("hp is " + string(hp) + ", destroying object")
		instance_destroy()
	}
}