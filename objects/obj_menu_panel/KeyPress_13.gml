if (is_open == false) {
	return
}

switch (target_index) {
	case 0:
		switch_panel()
		break
	case 1:
		room_restart()
		switch_panel()
		break
	case 3:
		room_goto(Intro)
		close()
		break
}
