/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_player_1)) {
	var cam_x = camera_get_view_x(cam)
	var cam_y = camera_get_view_y(cam)
	var cam_w = camera_get_view_width(cam)
	var cam_h = camera_get_view_height(cam)
	
	if (cam_y <= 0) {
		spd = 0
	}
	
	if (obj_player_1.y + obj_player_1.sprite_height/2 >= cam_y + cam_h) {
		obj_player_1.y = cam_y + cam_h - obj_player_1.sprite_height/2
	}
	
	if (obj_player_1.y - obj_player_1.sprite_height/2 <= cam_y) {
		obj_player_1.y = cam_y + obj_player_1.sprite_height/2
	}
	
	speed = spd
	obj_player_1.speed = spd
}