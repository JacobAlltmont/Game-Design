// @description creates damage function and sets gravity

	if !variable_global_exists("score"){global.score = 0}
	if !variable_global_exists("gems_collected"){global.gems_collected = 0}
	if !variable_global_exists("deaths"){global.deaths = 0}
	if !variable_global_exists("boss_death"){global.boss_death = false}
	if !variable_global_exists("final_score"){global.final_score = 0}
	//global.gem_multiplier = 


calculate_in_game_score = function () {
	return max(0,global.score)
}

calculate_score = function (){
	if (global.boss_death == true) {
		global.final_score = global.score * max(0.5,(global.gems_collected - global.deaths / 2))
		return global.final_score
	}else{
		return 0
	}
}


gravityMagnitude = 0.7
gravityDirection = new Vector2(0,1) // gravity going down by default

window_set_size(1280, 720);	

/// @function take_damage(obj,amount)
/// @description decrements obj's hp by amount
/// @param {Asset.GMObject} obj the obj who will lose health
/// @param {Real} amount the amount of health the object will lose
function take_damage(obj,amount) {
	if (variable_instance_exists(obj,hp)) {
		hp =- amount
		if(hp <= 0){
			obj.instance_destroy(true)
		}
	}
}

/// @function set_gravity(dir,scale)
/// @description sets the room's gravity to be in dir direction, and scale magnitude.
/// gravity direction can only be north,south,east,west (for now...)
/// @param {Vector2} dir the new direction for gravity
/// @param {Real} scale the magnitude fo the new gravity
function set_gravity(dir,scale){
	if (is_real(scale) and is_struct(dir) and
		variable_struct_exists(dir,__type) and dir.__type == "Vector2"){
			gravityDirection = dir.normalize()
			gravityMagnitude = scale
	}
}