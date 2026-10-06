draw_self()

if (top == noone) {
	return
}

draw_set_alpha(0.5);
draw_set_colour(make_colour_rgb(123, 94, 176))
draw_rectangle(x - 8 - sin(lt), y, top.x + 7 + sin(lt), top.y, false)
draw_set_alpha(1);
draw_self()
draw_set_colour(c_white)