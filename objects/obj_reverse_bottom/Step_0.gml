
function find_top_obj() {
	for (i = 0; i < instance_number(obj_reverse_top); i++) {
		var i_inst = instance_find(obj_reverse_top, i)
		if (i_inst.x == x) {
			return i_inst
		}
	}
	return noone
}

if (top == noone) {
	top = find_top_obj()
	return
}

lt += 0.1

function is_in_player() {
	if (obj_player.x > x-8 and obj_player.y < y and obj_player.x < x +9 and obj_player.y > top.y) {
		return true
	}
	return false
}

if is_in_player() {
	obj_player.g = 0.09
	obj_player.velocity.y = 0
} else {
	obj_player.g = global.G
}