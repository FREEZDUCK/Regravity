if (room != 0) {
	part_system_layer(global.ps, "particles");
}

function change_fullscreen() {
	global.is_fullscreen = !global.is_fullscreen
	window_set_fullscreen(global.is_fullscreen)
}


function get_key_direction(a, b) {
	return keyboard_check(ord(b)) - keyboard_check(ord(a))
}

function camera_shake(shakePower, duration) {
	obj_camera.shakePower = shakePower
	obj_camera.shakeDuration = duration * 60
}

function is_animation_finish(obj) {
	if (obj.image_index >= obj.image_number - 1) {
		return true
	}
	return false
}

function is_on_floor(obj) {
	with (obj) {
		return place_meeting(x, y+0.5, coll_list)
	}
}

function is_touch_ceiling(obj) {
	with (obj) {
		return place_meeting(x, y-0.5, coll_list)
	}
}

function is_on_wall(obj, margin = 1) {
	with (obj) {
		if (place_meeting(x + margin, y, coll_list)) {
			return 3
		}
		else if (place_meeting(x - margin, y, coll_list)) {
			return 1
		}
		return 0
	}
}

function get_direction(x0, y0, x1, y1) {
	var dx = x1 - x0
	var dy = y1 - y0
	var len = point_distance(0, 0, dx, dy)

	if (len == 0) return {x : 0, y : 0}

	return {x : dx / len, y : dy / len}
}

function nomarlized(target_v) {
	var dx = target_v.x - 0
	var dy = target_v.y - 0
	var len = point_distance(0, 0, dx, dy)

	if (len == 0) return {x : 0, y : 0}

	return {x : dx / len, y : dy / len}
}

function is_only_on_wall(obj, margin = 1) {
	return is_on_wall(obj, margin) and not is_on_floor(obj)
}

function cmove_and_collide(obj, bounce_x = 0, bounce_y = 0) {
	with (obj) {
		var is_coll = false
		var _subPixel = 0.5;
		velocity.x += impulse.x
		velocity.y += impulse.y
		
		impulse.x *= 0.7
		impulse.y *= 0.7

		// x 처리
		if (place_meeting(x + velocity.x, y, coll_list)) {
			is_on_wall = true;
			var _pixelCheck = _subPixel * sign(velocity.x);
			if (!place_meeting(x + _pixelCheck, y, coll_list)) {
				x += _pixelCheck;
			}
			
			if (bounce_x != 0) {
				velocity.x *= -bounce_x;
				
				if (abs(velocity.x) < 0.07) {
					velocity.x = 0
				}
				
			} else {
				velocity.x = 0;
			}
		} else {
			is_on_wall = false;
		}
		x += velocity.x / mass;

		// y 처리
		if (place_meeting(x, y + velocity.y, coll_list)) {
			is_on_floor = true;
			var _pixelCheck = _subPixel * sign(velocity.y);
			if (!place_meeting(x, y + _pixelCheck, coll_list)) {
				y += _pixelCheck;
			}
			if (bounce_y != 0) {
				velocity.y *= -bounce_y;
				
				if (abs(velocity.y) < 0.07) {
					velocity.y = 0
				}
				
			} else {
				velocity.y = 0;
			}
		} else {
			is_on_floor = false;
		}
		
		if (velocity.y < 0) {
			y += velocity.y / mass
			return
		}
		y += velocity.y

	}
}