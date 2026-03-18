damage_player = function(obj,amount){
	if(obj == obj_player){
		take_damage(obj,amount)
		
	}
}

take_damage = function(obj,amount) {
	if (variable_instance_exists(obj, hp)) {
		obj.hp =- amount
		show_debug_message("Player damaged")
		if(obj.hp <= 0){
			obj.instance_destroy(true)
		}
	}
}

dmg = 1 