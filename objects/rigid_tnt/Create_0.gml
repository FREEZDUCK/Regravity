event_inherited()
mass = 2
blink_count = 0
once = true
is_boom = false

function BOOM() {
	is_boom = true
	sprite_index = spr_white_boom
	var boom_power = 100
	var boom_dir = Command.get_direction(x, y, obj_player.x, obj_player.y)
	var dis_player = point_distance(x, y, obj_player.x, obj_player.y)
	
	var calu_power = boom_power / power(dis_player, 1.08)
	
	if (calu_power < 0.1) {
		return
	}
	
	obj_player.velocity.x += calu_power * boom_dir.x
	obj_player.velocity.y += calu_power * boom_dir.y / 1.8
	
}