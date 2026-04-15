function BossHit(_boss, _damage){
	
	if (!instance_exists(_boss)) exit
	
	_boss.hp -= _damage
	_boss.hurtFlashTimer = 4
	
	if (_boss.hp <= 0) {
	
		with (_boss) {
			
			instance_destroy()
			
		}
	
	}
	
}