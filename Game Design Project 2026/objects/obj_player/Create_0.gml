/// @description initialize hp and speed

/// @type {Vector2}
spawn = new Vector2(x,y)
dir = new Vector2(0,0)
spd = 1 // speed constant
sprintMultiplier = 2
useStamina = true
staminaLimit = 5 * game_get_speed(gamespeed_fps)
stamina = staminaLimit

basehp = 10
hp = basehp //placeholder

scale = 1
image_xscale = scale
image_yscale = scale

collisionBlocks = [abstract_block,layer_tilemap_get_id(layer_get_id("Ground"))]
directions = [
	new Vector2(-1,0),	//left
	new Vector2(1,0),	//right
	new Vector2(0,-1),	//up
	new Vector2(0,1)	//down
]
inputs = [false,false,false,false,false,false]

isPlayer = true

//facing_right = true

if(instance_number(obj_player) > 1){
	throw ("Error (obj_player.Create): an instance of obj_player was created when one already existed")
}

/// @function take_damage(amount);
/// @description damages the player by amount
/// @param {Real} amount the amount of hp which will be lost
take_damage = function(amount){
	hp -= amount
	if hp <= 0 {
		sprite_index = spr_player_death
		show_debug_message("player was killed")
	}
}

/// @function reset(died);
/// @description resets the player after a death, but doesn't full reset the level
/// @param {Bool} died whether or not to add to the global death count
reset = function(died){
	x = spawn.x
	y = spawn.y
	sprite_index = spr_player_idle
	if died {
		global.deaths++
	}
	dir = new Vector2(0,0)
	hp = basehp
	powerSwingCooldown = 0
	ultimateAttackCooldown = 0
}


hurtFlashTimer = 0

powerSwingCooldownMax = 300
ultimateAttackCooldownMax = 1000

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