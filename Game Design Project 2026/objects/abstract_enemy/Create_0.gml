/// @description declare damage_player function


hp = 1

take_damage = function(amount) {
	hp -= amount
	if(hp <= 0){
		instance_destroy(true)
	}
}