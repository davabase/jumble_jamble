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
    
    if (light != noone)
    {
        light_set_enable(light, true);
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

if (type == "person" && instance_exists(Player))
{
    if (point_distance(x, y, Player.x, Player.y) < 175)
    {
        if (current_time - throw_timer > throw_time)
        {
            var dir = point_direction(x, y, Player.x, Player.y);
            var i = instance_create_depth(x + lengthdir_x(18, dir), y + lengthdir_y(18, dir), 0, Object);
            i.type = "weapon";
            i.throw = true;
            i.throw_dir = dir;
            throw_timer = current_time;
        }
    }
}

if (room == rm_room_4 || room == rm_room_5 && text != "")
{
    if (mouse_check_button_released(mb_left))
    {
        text = "";
    }
}