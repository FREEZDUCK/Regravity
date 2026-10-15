if (selected_index == 0) {
	// Play 버튼
	Command.goto_level(global.level)
	//room_goto(level_0)
} else if (selected_index == 1) {
	// 맵 만들기 나중에 만들기
} else if (selected_index == 2) {
	// Settings 버튼
	// obj_MENU 완성하고 하기
} else if (selected_index == 3) {
	// Exit
	Command.save_gameData()
	game_end()
}