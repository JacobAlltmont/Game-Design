function PlayerState_Attack(){

	var _attackSprite = spr_player_basic_attack
	var _attackMask = spr_player_basic_attack_HITBOX
	var _damage = 2
	
	switch (attackType) {
		case PLAYERATTACK.BASIC:
			_attackSprite = spr_player_basic_attack
			_attackMask = spr_player_basic_attack_HITBOX
			_damage = 2
			break
		
		case PLAYERATTACK.POWER:
			_attackSprite = spr_player_power_swing
			_attackMask = spr_player_power_swing_HITBOX
			_damage = 4
			break
		
		case PLAYERATTACK.ULTIMATE:
			_attackSprite = spr_player_ultimate_attack
			_attackMask = spr_player_ultimate_attack_HITBOX
			_damage = 7
			break
	}
	
	dir = new Vector2(0, 0)
	
	if (sprite_index != _attackSprite) {
		
		sprite_index = _attackSprite
		image_index = 0
		ds_list_clear(hitByAttack)
		
	}
	
	mask_index = _attackMask
	var hitByAttackNow = ds_list_create()
	var hits = instance_place_list(x, y, obj_boss_hurtbox, hitByAttackNow, false)
	//
	hits += instance_place_list(x,y,abstract_enemy, hitByAttackNow, false)
	//
	if (hits > 0) {
		
		for (var i = 0; i < hits; i++) {
			
			var hitID = hitByAttackNow[| i]
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				
				ds_list_add(hitByAttack, hitID)
				
				//var bossID = hitID.owner

				//if (instance_exists(bossID)) {
					
				//	BossHit(bossID, _damage)
					
				//}
				
				var enemy = hitID
				
				if variable_instance_exists(hitID,"owner") {
					enemy = hitID.owner
					global.score += 20
				}

				if instance_exists(enemy) and enemy.object_index == obj_boss { // boss
					BossHit(enemy, _damage)
				} else if instance_exists(enemy) and enemy.object_index != obj_player { 
					//show_debug_message("hitting enemy")
					enemy.take_damage(_damage)
				}
					
			}
			
		}
		
	}
	
	ds_list_destroy(hitByAttackNow)
	mask_index = spr_player_idle
	
	if (animation_end()) {
	
		sprite_index = spr_player_idle
		state = PLAYERSTATE.FREE
	
	}

}