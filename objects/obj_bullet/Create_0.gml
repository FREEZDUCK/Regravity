dir = {x : 0, y : 0}
velocity = {x: 0, y: 0}
impulse = {x: 0, y: 0}
mass = 1

shootSpeed = 2
lifetime = 0
is_on_floor = false
is_on_wall = false

coll_list = [layer_tilemap_get_id("coll_tile")]

function kill() {
	instance_create_layer(x - (dir.x * shootSpeed / 2), y, "lights", obj_fullLight_16x)
	instance_destroy(self)
}