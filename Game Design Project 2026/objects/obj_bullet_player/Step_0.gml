var _layer = layer_get_id("Ground");
var map = layer_tilemap_get_id(_layer);

if (tilemap_get_at_pixel(map, x, y) > 0) {
    instance_destroy(id, true);
}