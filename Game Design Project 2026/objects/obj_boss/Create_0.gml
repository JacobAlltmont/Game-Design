
hsp = 0
vsp = 0
spd = 2
grv = 0.5

hp = 1

hurtFlashTimer = 0
attackCooldown = 45
hurtbox = noone

collisionBlocks = [abstract_block, layer_tilemap_get_id(layer_get_id("Ground"))]

enum BOSSSTATE
{
	IDLE,
	ATTACK,
}

enum BOSSATTACK
{
	ATTACK1,
	ATTACK2,
	ATTACK3,
	ATTACK4,
}

state = BOSSSTATE.IDLE
attackType = BOSSATTACK.ATTACK1

hitByAttack = ds_list_create()

hurtbox = instance_create_layer(x, y, "Instances", obj_boss_hurtbox)
hurtbox.owner = id