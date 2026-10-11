if (freeze == false) {
	
	if (Command.is_touch_ceiling(self) == false) {
		velocity.y -= 0.105
	}else {
		velocity.y = 0
	}
	
	image_angle = velocity.x * 5
}

event_inherited()