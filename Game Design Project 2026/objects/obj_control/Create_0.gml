// @description creates damage function

gravityMagnitude = 1
gravityDirection = [0,1] //down

window_set_size(1280, 720);	

function take_damage(obj,amount) {
	if (variable_instance_exists(obj,hp)) {
		hp =- amount
		if(hp <= 0){
			obj.instance_destroy(true)
		}
	}
}