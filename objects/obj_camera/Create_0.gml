cam = view_camera[0];

cam_pos = {x : x, y : y}

shakePower = 0
shakeDuration = 0

application_surface_enable(false);
// game_width, game_height are your base resolution (ideally constants)
game_width = camera_get_view_width(view_camera[0]);
game_height = camera_get_view_height(view_camera[0]);
// in GMS1, set view_wview and view_hview instead
camera_set_view_size(view_camera[0], game_width + 1, game_height + 1);
display_set_gui_size(game_width, game_height);
view_surf = -1;

x = obj_player.x - game_width / 2;
y = obj_player.y - 20 - game_height / 2;