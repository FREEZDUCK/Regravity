global.G = 0.1
global.jump_padding_frames = 5
global.is_fullscreen = false
global.GUI_WIDTH = 1920
global.GUI_HEIGHT = 1080

global.setting_prev_room = Intro

global.level = int64(0)
global.attempt = 1
global.lang = "en"

global.ps = part_system_create();

global.level_titles = [
	"0. Move to Portal",
	"1. Jump!",
	"2. Need Wall Slide",
	"3. Repeat Wall Slide",
	"4. Combination",
	"5. Hard Combination",
	"6. More Hard",
	"7. Red Blocks",
	"8. Practices For Red Blocks",
	"9. Limit of Wall Slide",
	"10. Red and Limit",
	"11. Use the GUN",
	"12. Box can do It!"
]

// SETTING 초기값
global.is_wasd = true



// 외부 저장값
global.GAMEDATA_JSON_FILE_NAME = "gameData.json"
global.LEVELS_FOLDER_NAME = "levels"


//var path = working_directory + "settings.json";

//var settings = {
//    init_fullscreen : global.is_fullscreen,
//    language : "en",
//	is_wasd : global.is_wasd,
//	level : global.level
//};

//// Struct → JSON 문자열
//var json = json_stringify(settings);

//// 파일 생성 및 쓰기
//var file = file_text_open_write(path);
//file_text_write_string(file, json);
//file_text_close(file);

function create_init_folders() {
	// levels 폴더가 없으면 새로 만듦
	if (not directory_exists(global.LEVELS_FOLDER_NAME)) {
		var dir_code = directory_create(global.LEVELS_FOLDER_NAME);
		
		if (not dir_code) { // 못 만드는 상황이면, 오류 출력
			show_message("The \"levels\" folder could not be created.\nAs a result, errors may occur when creating custom maps.")
		}
    }
	
	// gameData.json 파일이 없으면 새로 만듦
	if (not file_exists(global.GAMEDATA_JSON_FILE_NAME)) {
		Command.save_gameData()
	}
}
create_init_folders()
Command.sync_gameData()