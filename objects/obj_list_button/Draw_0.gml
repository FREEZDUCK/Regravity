intext = "<<  " + string(list[current_index]) + "  >>"
cursor_x = device_mouse_x_to_gui(0)
cursor_y = device_mouse_y_to_gui(0)

function draw_default_text() {
	draw_set_halign(fa_center)
	draw_set_colour(make_colour_rgb(46, 184, 36))
	draw_set_font(font_MENU_inText)
	draw_text(x, y, intext)
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
}

function detect_click() {
	if (not mouse_check_button_pressed(1)) {
		return 0
	}
	draw_set_font(font_MENU_inText)
	
	var text_width_half = string_width(intext) / 2
	var text_height = string_height(intext)
	var DATW = string_width("<<") // double_arrow_text_width
	
	if (not (cursor_y > y and cursor_y <= y + text_height)) {
		return 0
	}
	
	// 왼쪽
	if (cursor_x >= x - text_width_half and cursor_x <= x - text_width_half + DATW) {
		show_debug_message("LEFT" + string(random(1)))
		current_index = clamp(current_index - 1, 0, array_length(list) - 1)
	}
	else if (cursor_x >= x + text_width_half - DATW and cursor_x <= x + text_width_half) {
		current_index = clamp(current_index + 1, 0, array_length(list) - 1)
		show_debug_message("RIGHT" + string(random(1)))
	}
}

draw_default_text()
detect_click()