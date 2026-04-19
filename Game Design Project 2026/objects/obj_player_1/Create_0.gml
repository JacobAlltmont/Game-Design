/// @description initialize hp and speed

/// @type {Vector2}
dir = new Vector2(0,0)
spd = 1 // speed constant
collisionBlocks = [abstract_block,layer_tilemap_get_id(layer_get_id("Ground"))]
directions = [
	new Vector2(-1,0),	//left
	new Vector2(1,0),	//right
	new Vector2(0,-1),	//up
	new Vector2(0,1)	//down
]
inputs = pointer_null

isPlayer = true

scale = 1
image_xscale = scale
image_yscale = scale

//facing_right = true

if(instance_number(obj_player_1) > 1){
	throw ("Error (obj_player_1.Create): an instance of obj_player_1 was created when one already existed")
}

/// @function damage_enemy(obj,amount);
/// @description damages obj by amount
/// @param {Asset.GMObject} obj the object which will be damaged
/// @param {Real} amount the amount of hp which will be lost
damage_player = function(obj,amount){
	if(obj == abstract_enemy){
		take_damage(obj,amount)
	}
}

hp = 100 //placeholder

hurtFlashTimer = 0

powerSwingCooldown = 0
ultimateAttackCooldown = 0

attackType = PLAYERATTACK.BASIC
state = PLAYERSTATE.FREE

hitByAttack = ds_list_create()

hurtbox = instance_create_layer(x, y, "Instances", obj_player_hurtbox)
hurtbox.owner = id

enum PLAYERSTATE
{
	FREE,
	ATTACK,
}

enum PLAYERATTACK
{
	BASIC,
	POWER,
	ULTIMATE,
}