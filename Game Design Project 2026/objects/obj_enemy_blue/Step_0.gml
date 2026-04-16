/// @description for shooting and damaging the player

var p = instance_nearest(x, y, obj_player);

if hp <= 0{
	instance_destroy(id, true)
}

if (instance_exists(p)) {
	var dir = point_direction(x, y, p.x, p.y)
	direction = dir
	image_angle = dir
}

if (instance_exists(p) and can_shoot)	{
	    var dir = point_direction(x, y, p.x, p.y);
	    var spd = 2;

	    b = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
		show_debug_message("bullet made")
	    with (b)
	    {
	        motion_set(dir, spd);
	        //bullet_color = other.enemy_color;
	    }
		can_shoot = true
		alarm[0] = 10

	}