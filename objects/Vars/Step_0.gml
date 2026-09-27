if (keyboard_check(vk_alt) and keyboard_check_pressed(vk_enter)) {
	is_fullscreen = !is_fullscreen
	window_set_fullscreen(is_fullscreen)
}
