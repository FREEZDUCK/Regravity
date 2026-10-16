is_open = false

allow_buttons_show = false

target_index = 0
buttons_layer = layer_get_flexpanel_node("UI_menu_buttons")
button_amount = flexpanel_node_get_num_children(buttons_layer)
buttons_eId = []

function switch_panel() {
	is_open = !is_open
	target_index = 0
}

function open() {
	is_open = true
	image_yscale = 1
}

function close() {
	is_open = false
	target_index = 1
	image_yscale = 0
}

function control_buttons() {
	for (i = 0; i < button_amount; i++) {
		var this_id = buttons_eId[i]
		layer_text_alpha(this_id, allow_buttons_show)
		if (i == target_index) {
			layer_text_blend(this_id, make_colour_rgb(46, 184, 36));
		} else {
			layer_text_blend(this_id, c_white);
		}
	}
}

function load_inst_buttons() {
	for (i = 0; i < button_amount; i++) {
		var this_button = flexpanel_node_get_child(buttons_layer, i)
		var data = flexpanel_node_get_struct(this_button)
		var text_id = data.layerElements[0].elementId;
		
		array_push(buttons_eId, text_id)
	}
}
load_inst_buttons()