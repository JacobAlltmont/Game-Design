map = layer_tilemap_get_id(layer_get_id("Ground"));

if (tilemap_get_at_pixel(map, x, y) > 0) {
    instance_destroy(id, true);
}