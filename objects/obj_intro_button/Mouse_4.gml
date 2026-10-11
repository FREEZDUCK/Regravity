if (in_name == "PLAY") {
	room_goto(level_0)
} else if (in_name == "EXIT") {
	game_end()
} else if (in_name == "SETTINGS") {
	global.setting_prev_room = Intro
	room_goto(Setting)
}