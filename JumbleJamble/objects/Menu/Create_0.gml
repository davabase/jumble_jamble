load = noone;
rm = noone;
global.gold = 0;
if (file_exists("save.dat"))
{
    load = ds_map_secure_load("save.dat");
    rm = ds_map_find_value(load, "room");
    global.gold = ds_map_find_value(load, "gold");
}

start_selected = true;
continue_selected = false;
fullscreen_selected = false;

start_y1 = 0;
start_y2 = 0;

continue_y1 = 0;
continue_y2 = 0;

fullscreen_y1 = 0;
fullscreen_y2 = 0;