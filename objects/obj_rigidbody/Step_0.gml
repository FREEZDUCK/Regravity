
if (freeze == false) {
	layer = default_layer
} else {
	layer = freeze_layer
}
if (freeze != _prev_freeze) {
	ps = part_system_create_layer("particles", 0, par_shoot)
	part_system_position(ps, x, y)
	
	_prev_freeze = freeze
}

if (freeze == true) {
	return
}

velocity.x *= damp
velocity.y *= damp
if (not Command.is_on_floor(self)) {
	velocity.y += g
	
}

Command.cmove_and_collide(self, bounce.x, bounce.y)