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

_SETTINGS_LEFT_GUIS = {
	"check" : "FULLSCREEN",
	"list" : "CONTROL TYPE"
}
_SETTINGS_RIGHT_GUIS = {
	"check" : "FULLSCREEN",
	"list" : "CONTROL TYPE"
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