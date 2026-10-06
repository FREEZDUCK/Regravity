if (place_meeting(x, y - 1, obj_player) and freeze == false) {
	obj_player.velocity.x = velocity.x * 1.1
}

event_inherited()