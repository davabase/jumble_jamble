if (room == rm_intro)
{
    if (Camera.state == "follow" && show_timer == 0)
    {
        show_timer = current_time;
    }
    else if (show_timer != 0)
    {
        if (current_time - show_timer > show_time)
        {
            show_text = true;
        }
    }

    if (mouse_check_button(mb_left) && show_text && text_timer == 0)
    {
        text_timer = current_time;
    }

    if (text_timer != 0)
    {
        if (current_time - text_timer > text_time)
        {
            show_text = false;
        }
    }
}
else if (room == rm_room_2)
{
    if (show_text)
    {
        if (mouse_check_button(mb_left))
        {
            alarm[0] = 1;
            with (Gold)
            {
                instance_destroy();
            }
            show_text = false;
            
            var layer_id = layer_get_id("Tiles_Back");
            var tile_id = layer_tilemap_get_id(layer_id);
            tilemap_tileset(tile_id, ts_sheet);

            layer_id = layer_get_id("Tiles_Front");
            tile_id = layer_tilemap_get_id(layer_id);
            tilemap_tileset(tile_id, ts_sheet);
        }
    }
}
else if (room == rm_room_3)
{
    if (text == "god has forsaken me")
    {
        if (mouse_check_button_pressed(mb_left))
        {
            text = "i shall become god";
            shake_text = true;
            text_reveal_timer = current_time;
        }
    }
    else if (show_text)
    {
        if (mouse_check_button_pressed(mb_left))
        {
            show_text = false;
            text = "";
            Control.can_move = true;
            with(Gem.wall)
            {
                instance_destroy();
            }
        }
    }

    if (show_text && shake_text)
    {
        if (current_time - text_reveal_timer > text_reveal_time)
        {
            text_reveal++;
            text_reveal_timer = current_time;
        }
    }
}

if (on_fire && on_fire_hit_time != 0)
{
    if (current_time - on_fire_timer > on_fire_hit_time)
    {
        hit_points -= 1;
        on_fire_timer = current_time;
    }

    if (hit_points >= 4 && !fire_1)
    {
        fire_1 = true;
        fire_1_x = random(16) - 8;
        fire_1_y = random(16) - 8;
    }
    else if (hit_points == 2 && !fire_2)
    {
        fire_2 = true;
        fire_2_x = random(16) - 8;
        fire_2_y = random(16) - 8;
    }
    else if (hit_points < 2 && !fire_3)
    {
        fire_3 = true;
        fire_3_x = random(16) - 8;
        fire_3_y = random(16) - 8;
    }
}
else
{
    fire_1 = false;
    fire_2 = false;
    fire_3 = false;
}

if (hit_points <= 0)
{
    instance_destroy();
}

if (light != noone)
{
    light_set_position(light, x, y);
}

if (room == rm_ending)
{
    if (mouse_check_button_pressed(mb_left))
    {
        room_goto(rm_menu);
    }
}