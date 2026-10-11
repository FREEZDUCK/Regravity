current_index = 0
list = []


control_type_list = ["WASD", "Arrow"]

if (type == "control_type") {
	list = control_type_list
}

cursor_x = device_mouse_x_to_gui(0)
cursor_y = device_mouse_y_to_gui(0)
intext = "<<  " + string(list[current_index]) + "  >>"
