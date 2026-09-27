var target_x = obj_player.x - game_width / 2;
var target_y = obj_player.y - 20 - game_height / 2;

shakeDuration = clamp(shakeDuration - 1, 0, shakeDuration)

var r_shakeOffset = {x : 0, y : 0}
if (shakeDuration != 0) {
	r_shakeOffset.x = random_range(-shakePower, shakePower)
	r_shakeOffset.y = random_range(-shakePower, shakePower)
} else {
	shakePower = 0
}

x = clamp(lerp(x, target_x, 0.1) + r_shakeOffset.x, 0, room_width - game_width);
y = clamp(lerp(y, target_y, 0.1) + r_shakeOffset.y, 0, room_height - game_height);
cam_pos.x = x + game_width / 2
cam_pos.y = y + game_width / 2