// @description creates damage function

gravityMagnitude = 1.0
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