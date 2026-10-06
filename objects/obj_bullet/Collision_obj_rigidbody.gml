other.velocity.x += dir.x
other.velocity.y += Command.get_direction(x, y, other.x, other.y).y
other.freeze = false
kill()	