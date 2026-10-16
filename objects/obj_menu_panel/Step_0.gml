image_yscale = lerp(image_yscale, is_open, 0.3)
allow_buttons_show = image_yscale > 0.7
control_buttons()

// Intro 에선 키로 작동 시키지 않겠다는 의미에용ㅇ
if (room == Intro) {
	return
}

if keyboard_check_pressed(vk_escape) {
	switch_panel()
} else if keyboard_check_pressed(vk_tab) and is_open {
	if target_index >= button_amount - 1 {
		target_index = 0
	} else {
		target_index++
	}
}

