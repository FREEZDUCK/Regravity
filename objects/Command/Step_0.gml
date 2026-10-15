if (keyboard_check_pressed(vk_f11)) {
	change_fullscreen()
}

if (keyboard_check_pressed(vk_f1)) {
	global.is_wasd = !global.is_wasd
}
