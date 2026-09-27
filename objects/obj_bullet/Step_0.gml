velocity.x += dir.x * shootSpeed
velocity.y += dir.y * shootSpeed

velocity.x = clamp(velocity.x, -14, 14)
velocity.y = clamp(velocity.y, -14, 14)

lifetime += 1

if (lifetime >= 120) {
	instance_destroy(self)
}

image_angle = point_direction(0, 0, dir.x, dir.y)

if (is_on_floor or is_on_wall) {
	kill()
}

Command.cmove_and_collide(self)