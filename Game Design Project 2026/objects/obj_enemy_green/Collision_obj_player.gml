

if !instance_exists(obj_player) or hitCooldown > 0 {
	return
}

obj_player.take_damage(dmg)

hitCooldown = hitRate