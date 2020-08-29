if (mouse_y > start_y1 && mouse_y < start_y2)
{
    start_selected = true;
    continue_selected = false;
    fullscreen_selected = false;
}
else if (load != noone && mouse_y > continue_y1 && mouse_y < continue_y2)
{
    continue_selected = true;
    start_selected = false;
    fullscreen_selected = false;
}
else if (mouse_y > fullscreen_y1 && mouse_y < fullscreen_y2)
{
    fullscreen_selected = true;
    start_selected = false;
    continue_selected = false;
}
else
{
    start_selected = false;
    continue_selected = false;
    fullscreen_selected = false;
}

if (mouse_check_button_pressed(mb_left))
{
    if (start_selected)
    {
        global.gold = 0;
        room_goto(rm_intro);
    }
    else if (continue_selected)
    {
        room_goto(rm);
    }
    else if (fullscreen_selected)
    {
        window_set_fullscreen(!window_get_fullscreen());
    }
}