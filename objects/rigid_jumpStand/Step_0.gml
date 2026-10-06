event_inherited()

if (freeze == true) {
	return
}

if (image_index = 4) {
	image_index = 0
	image_speed = 0
}

if (place_meeting(x, y - 1, obj_player) and can_push) {
	obj_player.impulse.y -= 1.3
	image_speed = 1
	alarm[0] = 65
	can_push = false
}