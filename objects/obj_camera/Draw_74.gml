display_set_gui_size(game_width, game_height);
if (surface_exists(view_surf)) {
    draw_surface_part(view_surf, frac(x), frac(y), game_width, game_height, 0, 0);
    //draw_surface(view_surf, -frac(x), -frac(y));
}
display_set_gui_size(global.GUI_WIDTH, global.GUI_HEIGHT);