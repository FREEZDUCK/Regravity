global.G = 0.1
global.jump_padding_frames = 5
global.is_fullscreen = false

global.setting_prev_room = Intro

global.level = 0
global.attempt = 1

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
global.is_chae_key = false

//room_goto_next()