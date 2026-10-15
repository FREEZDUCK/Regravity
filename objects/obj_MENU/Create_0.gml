allow_user_control = false

_panel_height = 0
_MAX_PANEL_HEIGHT = 100

is_open_menu = false
is_settings_open = false

_menu_target_index = 0

_MENU_BUTTON_AMOUNT = 4
_MENU_BUTTON_START_X = 100
_MENU_BUTTON_START_Y = 30

_MENU_BUTTON_PART_WIDTH = 1920/_MENU_BUTTON_AMOUNT
_MENU_BUTTONS_INTEXT = ["CLOSE", "RESTART", "SETTINGS", "GO TITLE"]

_SETTINGS_LEFT_GUIS = { // obj로 만든 것만
	"check" : "FULLSCREEN",
	"list" : "CONTROL TYPE"
}
_SETTINGS_LEFT_START_X = 40
_SETTINGS_LEFT_START_Y = _MAX_PANEL_HEIGHT + 40
_SETTINGS_LEFT_GAP_Y = 30

_SETTINGS_RIGHT_TEXTS = {
	"0" : [
		"< Player >",
		"  Move Left : [A]",
		"  Move Right : [D]",
		"  Jump : [Space]",
		"  Use Gun : [Enter]",
		"  Enter Portal : [W]"
		],
	"1" : [
		"< Player >",
		"  Move Left : [Left Arrow]",
		"  Move Right : [Right Arrow]",
		"  Jump : [Space]",
		"  Use Gun : [E]",
		"  Enter Portal : [Up Arrow]"
		],
}
_SETTINGS_TEXTS_H_GAP = 20

function reload_settings() {
	if not is_open_menu {
		is_settings_open = false
		layer_set_visible("MENU_EFX", is_settings_open)
		return
	}
	
	layer_set_visible("MENU_EFX", is_settings_open)
}

function switch_menu() {
	is_open_menu = !is_open_menu
	reload_settings()
}

function set_instances() {
	var keys = struct_get_names(_SETTINGS_LEFT_GUIS)
	var len = array_length(keys)
	
	for (i = 0; i < len; i++) {
		if keys[i] == "check" {
			instance_create_layer(_SETTINGS_LEFT_START_X, _SETTINGS_LEFT_START_Y + _SETTINGS_LEFT_GAP_Y * i, "MENU", obj_check_button)
		}
	}
}

set_instances()