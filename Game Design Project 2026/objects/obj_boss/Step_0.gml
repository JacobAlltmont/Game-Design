
if (windDown > 0) {
	windDown --
} else if (attackCooldown > 0) {
	attackCooldown--
}

switch (state) {
	case BOSSSTATE.IDLE: BossState_Idle() break
	case BOSSSTATE.ATTACK: BossState_Attack() break
}

if (!place_meeting(x, y + 1, collisionBlocks)) {
	
	vsp += grv
	
} else if (vsp > 0) {
	
	vsp = 0
	
}

move_and_collide(hsp, vsp, collisionBlocks)

if (hurtFlashTimer > 0) {
	
	hurtFlashTimer--
	image_blend = c_red
	
} else {
	
	image_blend = c_white
	
}