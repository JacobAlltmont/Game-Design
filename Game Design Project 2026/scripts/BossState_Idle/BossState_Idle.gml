function BossState_Idle(){

	hsp = 0
	
	if windDown > 0 {
		sprite_index = spr_boss_taunt
	} else {
		sprite_index = spr_boss_idle
	}

	var _player = instance_nearest(x, y, obj_player)
	
	if (_player != noone) {
		
		
		if (attackCooldown <= 0 &&
			abs(_player.x - x) <= 110 && abs(_player.y - y) <= 80 &&
			abs(_player.y - y) <= 100) {
			
				var _roll = irandom(99)
			
				if (_roll < 40) {
					attackType = BOSSATTACK.ATTACK1
				} else if (_roll < 80) {
					attackType = BOSSATTACK.ATTACK2
				} else if (_roll < 95) {
					attackType = BOSSATTACK.ATTACK3
				} else {
					attackType = BOSSATTACK.ATTACK4
				}
			
				state = BOSSSTATE.ATTACK
				exit
			
		}
		
		if (windDown <= 0 && abs(_player.x - x) > 72) {
			var _dir = sign(_player.x - x)
			if (_dir != 0) image_xscale = _dir
			
			hsp = spd * _dir
			sprite_index = spr_boss_run
			
		}
		
	}

}