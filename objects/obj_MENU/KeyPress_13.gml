// UP MENU
if (allow_user_control == false) {
	return
}

var target_button = _MENU_BUTTONS_INTEXT[_menu_target_index]

if (target_button == "RESTART") {
	room_restart()
} else if (target_button == "GO TITLE") {
	room_goto(Intro)
} else if (target_button == "SETTINGS") {
	is_settings_open = !is_settings_open
	reload_settings()
} else if (target_button == "CLOSE") {
	switch_menu()
}