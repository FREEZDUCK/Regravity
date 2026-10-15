if keyboard_check_pressed(vk_tab) {
	if selected_index >= array_length(buttons_inTexts) - 1 {
		selected_index = 0
	} else {
		selected_index++
	}
}