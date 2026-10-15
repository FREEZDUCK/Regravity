draw_self()
draw_set_halign(fa_left)
draw_set_colour(make_colour_rgb(46, 184, 36))
draw_set_font(font_intro_button_in_text)
var inText = ""
if (index == 0) {
	inText = obj_intro_control.play_button_inTexts[global.level > 0]
} else {
	inText = obj_intro_control.buttons_inTexts[index]
}
draw_text(x + 8, y + 6, inText)
draw_set_colour(c_white)