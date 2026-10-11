var key_space

function shoot() {
	Command.camera_shake(1, 0.1)
	var inst_bullet = instance_create_layer(x, y - 7.5, "entity", obj_bullet)
	if (sprite_index == spr_player_jump_use_gun) {
		inst_bullet.dir = Command.nomarlized({x : image_xscale * 0.5, y : 1})
	}
	else if (sprite_index == spr_player_use_gun) {
		inst_bullet.dir = Command.nomarlized({x : image_xscale, y : 0})
	}
}

if (place_meeting(x, y, kill_tile)) {
	respawn()
}

function detect_portal() {
	is_in_portal = place_meeting(x, y, obj_portal)
}

function control_sfx() {
	//if (sprite_index == spr_player_run and (int64(image_index) == 0 or int64(image_index == 4))) {
	//	audio_play_sound(snd_footstep_1, 1, false);
	//}
}

function control_inputs() {
	moveSpeed = RUN_SPEED
	moveAccel = RUN_ACCEL
	prev_dir_x = dir.x
	dir.x = Command.get_key_direction("A", "D")
	
	if (global.is_chae_key) {
		dir.x = keyboard_check(vk_right) - keyboard_check(vk_left)
	}
	
	key_space = keyboard_check_pressed(vk_space) and (Command.is_on_floor(self) or is_wall_sliding or (not jump_padding_timer <= 0))
	
	
	var is_released_shoot_key = false
	
	if (global.is_chae_key) {
		is_released_shoot_key = keyboard_check_released(ord("E"))
	} else {
		is_released_shoot_key = keyboard_check_released(vk_enter)
	}
	
	if (is_released_shoot_key and (sprite_index == spr_player_use_gun or sprite_index == spr_player_jump_use_gun)) {
		shoot()
	}
	
	if (global.is_chae_key) {
		is_aimming = keyboard_check(ord("E")) and is_in_portal == false
	} else {
		is_aimming = keyboard_check(vk_enter) and is_in_portal == false
	}
	
	if (keyboard_check(vk_enter) and is_in_portal) {
		global.level += 1
		global.attempt = 1
		room_goto_next()
	}

	if (key_space) {
		if (abs(velocity.x) > 0.6 or is_wall_sliding) {
			if (is_wall_sliding and Command.is_on_wall(self)) {
				velocity.x += -(Command.is_on_wall(self) - 2) * 1.2
			}
			
			if (not jump_padding_timer <= 0) {
				if (jump_padding_timer <= 1) {
					// 극한 뛰었을 때
					ps = part_system_create_layer("particles", 0, par_shoot)
					part_system_position(ps, x, y)
					
				}
				velocity.y = -RUN_JUMPPOWER
			} else {
				velocity.y -= RUN_JUMPPOWER
			}
		} else {
			if (not jump_padding_timer <= 0) {
				velocity.y = -WALK_JUMPPOWER
			} else {
				velocity.y -= WALK_JUMPPOWER
			}
		}
		jump_padding_timer = 0
	}
	
	if (keyboard_check(vk_control)) {
		moveSpeed = WALK_SPEED
		moveAccel = WALK_ACCEL
	}
	
	if (Command.is_only_on_wall(self, 2) and velocity.y > 0) {
		if (Command.is_on_wall(self, 2) - 2 == dir.x) {
			is_wall_sliding = true
			jump_padding_timer = 0
		}
	} else {
		is_wall_sliding = false
	}

	velocity.x = lerp(velocity.x, moveSpeed * dir.x, moveAccel)
}

function control_physics() {
	if (is_aimming and sprite_index == spr_player_use_gun) {
		velocity.x = 0
	}
	if (not Command.is_on_floor(self)) {
		if (is_wall_sliding) {
			hangTime = 0
			velocity.y = g * 4
			return
		} else {
			jump_padding_timer = clamp(jump_padding_timer - 1, 0, global.jump_padding_frames)
		}
		velocity.y += g
	}
	else {
		jump_padding_timer = global.jump_padding_frames
		if (delta_pos.y >= 2.7) {
			is_fall_stun = true
			Command.camera_shake(4, 0.1)
		}
	}
}

function control_animation() {
	if (dir.x != 0) {
		image_xscale = dir.x
	}
	
	if (prev_dir_x != dir.x and sprite_index == spr_player_run and dir.x != 0) {
		prev_spr_index = sprite_index
		sprite_index = spr_player_run_turn
		image_index = 0
		prev_dir_x = dir.x
	}

	// Animation
	if (is_wall_sliding) {
		sprite_index = spr_player_wall_slide
	}
	else if (is_aimming) {
		if (Command.is_on_floor(self)) {
			sprite_index = spr_player_use_gun
		} else {
			sprite_index = spr_player_jump_use_gun
		}
	}
	else if (sprite_index == spr_player_jump or key_space) {
		if (sprite_index != spr_player_jump) {
			sprite_index = spr_player_jump
			image_index = 0
		}
		if (Command.is_animation_finish(self)) {
			sprite_index = spr_player_falling
		}
	}
	else if (not Command.is_on_floor(self)) {
		sprite_index = spr_player_falling
	}
	else if (sprite_index == spr_player_run_turn) {
		if (sprite_index != spr_player_run_turn) {
			sprite_index = spr_player_run_turn
			image_index = 0
		}
		if (Command.is_animation_finish(self)) {
			sprite_index = prev_spr_index
		}
	}
	else if (is_aimming) {
		sprite_index = spr_player_use_gun
	}
	else if (abs(velocity.x) > 0.6) {
		sprite_index = spr_player_run
	}
	else if (abs(velocity.x) > 0.03) {
		sprite_index = spr_player_walk
	} else {
		sprite_index = spr_player_idle
	}
}

function control_fall_stun() {
	sprite_index = spr_player_fall_stun
	velocity.x *= 0.88
	if (image_index >= image_number - 1) {
		is_fall_stun = false
	}
}

function control_rule() {
	if (y > room_height) {
		respawn()
	}
}

control_rule()
var delta_pos0 = {x : x, y : y}

control_physics()
//show_debug_message(jump_padding_timer)
control_sfx()
if (not is_fall_stun) {
	detect_portal()
	
	control_inputs()
	control_animation()
}
else {
	control_fall_stun()
}
Command.cmove_and_collide(self)
delta_pos.x = x - delta_pos0.x
delta_pos.y = y - delta_pos0.y