

var bullet = instance_create_layer(x, y, "Instances", obj_bullet_player);
show_debug_message("SHOoTING!");
if (image_xscale > 0) {
    motion_set(0, obj_bullet_player.spd);
} else {
    motion_set(180, obj_bullet_player.spd);
}