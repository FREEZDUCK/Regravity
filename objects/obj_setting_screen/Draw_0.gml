function draw_default_text(intext, plus_y) {
	draw_set_halign(fa_left)
	draw_set_colour(make_colour_rgb(46, 184, 36))
	draw_set_font(font_setting_in_text)
	draw_text(x + _TEXT_START_X, y + _TEXT_START_Y + plus_y, intext)
	draw_set_colour(c_white)
}

draw_self()
draw_default_text("FULLSCREEN", 0)
draw_default_text("CONTROL TYPE", 20)

if (keyboard_check_pressed(vk_escape)) {
	room_goto(global.setting_prev_room)
}