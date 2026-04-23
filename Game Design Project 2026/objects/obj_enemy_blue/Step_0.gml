/// @description for shooting and damaging the player

var p = instance_nearest(x, y, obj_player);


if (instance_exists(p)) {
	var dir = point_direction(x, y, p.x, p.y)
	direction = dir
	image_angle = dir
}

var distance = new Vector2(obj_player.x - x, obj_player.y - y).length()

if (instance_exists(p) and can_shoot and distance <= 300)	{
	var dir = point_direction(x, y, p.x, p.y);
	var spd = 1;

	b = instance_create_layer(x, y, "Instances", obj_bullet_enemy);
	//show_debug_message("bullet made")
	with (b)
	{
	    motion_set(dir, spd);
	    //bullet_color = other.enemy_color;
	}
	can_shoot = false
	alarm[0] = 3 * game_get_speed(gamespeed_fps)

}