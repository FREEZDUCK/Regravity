other.velocity.x += dir.x
other.velocity.y += Command.get_direction({x : x, y : y}, {x : other.x, y : other.y}).y
other.freeze = false
kill()	