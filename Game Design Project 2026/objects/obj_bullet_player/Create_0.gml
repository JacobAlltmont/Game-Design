damage_enemy = function(obj,amount){
	if(obj == abstract_enemy){
		take_damage(obj,amount)
		
	}
}

take_damage = function(obj,amount) {
	if (variable_instance_exists(obj, obj.hp)) {
		obj.hp -= amount
		show_debug_message("Enemy damaged")
		if(obj.hp <= 0){
			obj.instance_destroy(true)
		}
	}
}

dmg = 1
speed = 6