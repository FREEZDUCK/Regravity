if (keyboard_check(vk_alt) and keyboard_check_pressed(vk_enter)) {
	global.is_fullscreen = !global.is_fullscreen
	window_set_fullscreen(global.is_fullscreen)
}
