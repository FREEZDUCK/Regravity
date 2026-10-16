//Command.cmove_and 쓰기 위한 필수 변수들
velocity = {x: 0, y: 0}
coll_list = [layer_tilemap_get_id("coll_tile"), obj_rigidbody, obj_reverse_bottom, obj_reverse_top]
kill_tile = layer_tilemap_get_id("kill_tile")
mass = 1
impulse = {x: 0, y: 0}
g = global.G

dir = {x : 0, y : 0}
prev_dir_x = 0
prev_spr_index = spr_player_idle
WALK_SPEED = 0.5
WALK_ACCEL = 0.2
WALK_JUMPPOWER = 1.5
RUN_SPEED = 1.4
RUN_ACCEL = 0.1
RUN_JUMPPOWER = 2.1
jump_padding_timer = 0


is_aimming = false
is_wall_sliding = false
is_fall_stun = false
is_in_portal = false

delta_pos = {x : x, y : y}
start_pos = {x : x, y : y}

// Sound timers

function respawn() {
	global.attempt++
	room_restart()
//	velocity = {x : 0, y : 0}
//	x = start_pos.x
//	y = start_pos.y
}

function clear() {
	global.level += 1
	global.attempt = 1
	Command.goto_level(global.level)
}

function is_touching_rigid() {
	var this_rigid = instance_place(x + 2, y, obj_rigidbody)
	
	if (this_rigid == noone) {
		this_rigid = instance_place(x - 2, y, obj_rigidbody)
	}
	
	if (this_rigid == noone) {
		this_rigid = instance_place(x, y + 2, obj_rigidbody)
	}
	
	if (this_rigid == noone) {
		this_rigid = instance_place(x, y - 2, obj_rigidbody)
	}
	
	if (this_rigid != noone) {
		return this_rigid
	}
	
	return 0
}