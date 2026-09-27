if (place_meeting(x, y - 7, obj_player) and freeze == false) {
	obj_player.impulse.y -= 0.2
	image_index = 1
} else {
	image_index = 0
}
event_inherited()