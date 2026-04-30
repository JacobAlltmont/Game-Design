function BossState_Attack(){

	var _attackSprite = spr_boss_attack1
	var _attackMask = spr_boss_attack1_HITBOX
	var _damage = 2
	var _winddown = 1.5 * game_get_speed(gamespeed_fps)
	
	switch (attackType) {
		case BOSSATTACK.ATTACK1:
			//_attackSprite = spr_boss_attack1
			//_attackMask = spr_boss_attack1_HITBOX
			//_damage = 1
			//_winddown = 1 * game_get_speed(gamespeed_fps)
			break
			
		case BOSSATTACK.ATTACK2:
			_attackSprite = spr_boss_attack2
			_attackMask = spr_boss_attack2_HITBOX
			_damage = 2
			_winddown = 2 * game_get_speed(gamespeed_fps)
			break
			
		case BOSSATTACK.ATTACK3:
			_attackSprite = spr_boss_attack3
			_attackMask = spr_boss_attack3_HITBOX
			_damage = 3
			_winddown = 3 * game_get_speed(gamespeed_fps)
			break
			
		case BOSSATTACK.ATTACK4:
			_attackSprite = spr_boss_attack4
			_attackMask = spr_boss_attack4_HITBOX
			_damage = 5
			_winddown = 4 * game_get_speed(gamespeed_fps)
			break
	}
	
	var _cooldown = 0.75 * _winddown
	
	hsp = 0
	
	if (sprite_index != _attackSprite) {
		
		sprite_index = _attackSprite
		image_index = 0
		ds_list_clear(hitByAttack)
		
	}
	
	mask_index = _attackMask
	
	var hitByAttackNow = ds_list_create()
	var hits = instance_place_list(x, y, obj_player_hurtbox, hitByAttackNow, false)
	
	if (hits > 0) {
		
		for (var i = 0; i < hits; i++) {
			
			var hitID = hitByAttackNow[| i]
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				
				ds_list_add(hitByAttack, hitID)
				
				if (instance_exists(hitID.owner)) {
					with (hitID.owner) {
					
						//PlayerHit(_damage)
						take_damage(_damage)
					
					}
				}
			}	
		}
	}
	
	ds_list_destroy(hitByAttackNow)
	mask_index = spr_boss_idle
	
	if (animation_end()) {
	
		sprite_index = spr_boss_idle
		state = BOSSSTATE.IDLE
		windDown = _winddown
		attackCooldown = _cooldown
	
	}

}