if (keyboard_check(vk_alt) and keyboard_check_pressed(vk_enter)) {
	change_fullscreen()
}

if (keyboard_check_pressed(vk_f1)) {
	global.is_chae_key = !global.is_chae_key
}
