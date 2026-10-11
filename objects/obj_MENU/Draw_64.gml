function draw_panel() {
	draw_set_colour(c_black)
	draw_rectangle(0, 0, 1920, _panel_height, false)
	draw_set_colour(c_white)
}

function draw_key_info() {
	draw_set_colour(c_gray)
	draw_set_font(font_setting_in_text)
	draw_set_halign(fa_right)
	draw_text(1910, _MAX_PANEL_HEIGHT-40, "[TAB]")
	
	draw_set_colour(c_white)
	draw_set_halign(fa_left)
}

function draw_settings_text(dx, dy, text) {
	draw_set_halign(fa_left)
	draw_set_colour(make_colour_rgb(46, 184, 36))
	draw_set_font(font_intro_button_in_text)
	draw_text(dx, dy, text)
	draw_set_colour(c_white)
}

//function draw_settings() {
//	var half_width = 1920/2
	
//	for (i = 0; i < 2; i++) {
//		var max_j = 0
//		if (i == 0) {
//			max_j = array_length(struct_get_names(_SETTINGS_LEFT_GUIS))
//		} else if (i == 1) {
//			max_j = array_length(struct_get_names(_SETTINGS_TEXTS["RIGHT"]))
//		}
		
//		//draw_settings_text(i * half_width,)
//	}
//}

//draw_settings()

function draw_buttons() {
	for (i = 0; i < _MENU_BUTTON_AMOUNT; i++) {
		draw_set_colour(c_white)
		if (i == _menu_target_index) {
			draw_set_colour(make_colour_rgb(46, 184, 36))
		}
		draw_set_font(font_level_title)
		draw_set_halign(fa_center)
		draw_text((i * _MENU_BUTTON_PART_WIDTH + _MENU_BUTTON_PART_WIDTH * (i+1)) / 2,  _MENU_BUTTON_START_Y, _MENU_BUTTONS_INTEXT[i])
		draw_set_halign(fa_left)
	}
	draw_set_colour(c_white)
}


function control_menu_target_index() {
	if keyboard_check_pressed(vk_tab) {
		if _menu_target_index >= _MENU_BUTTON_AMOUNT - 1 {
			_menu_target_index = 0
		} else {
			_menu_target_index++
		}
	}
}

if (keyboard_check_pressed(vk_escape)) {
	switch_menu()
}

display_set_gui_size(1920, 1080);
if (is_open_menu == false) {
	if (_panel_height > 0.02) {
		_panel_height *= 0.7
		draw_panel()
	} else {
		_panel_height = 0
	}
	return
}

// is opening..
draw_panel()

_panel_height = lerp(_panel_height, _MAX_PANEL_HEIGHT, 0.2)

control_menu_target_index()
if (_panel_height > _MAX_PANEL_HEIGHT * 0.7) {
	allow_user_control = true
	draw_buttons()
	draw_key_info()
} else {
	allow_user_control = false
}