function PlayerHit(){

	var _damage = argument0
	
	hp -= _damage
	hurtFlashTimer = 4
	
	if (hp <= 0) {
	
		instance_destroy()
	
	}

}