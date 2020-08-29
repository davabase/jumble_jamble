draw_angle = -sin(theta) * max_angle;
theta += angle_increment;
if (theta > 2 * pi)
{
    theta = 0;
}

if (current_time - text_reveal_timer > text_reveal_start && text_reveal == 0)
{
    image_speed = new_image_speed;
    text_reveal_timer = current_time;
    text_reveal = 1;
}
else if (current_time - text_reveal_timer > text_reveal_time && text_reveal != 0)
{
    text_reveal++;
    text_reveal_timer = current_time;
}

if (text_reveal >= string_length(text))
{
    if (alpha_timer == 0)
    {
        alpha_timer = current_time;
    }

    if (current_time - alpha_timer > alpha_time)
    {
        text = "";
        image_alpha += alpha_inc;
        image_alpha = min(image_alpha, 1);
    }
    
    if (image_alpha == 1)
    {
        if (throw_timer == 0)
        {
            throw_timer = current_time;
        }
        if (current_time - throw_timer > throw_time)
        {
            can_throw = true;
        }
    }
}

if (can_throw && instance_exists(Player))
{
    if (current_time - throw_timer > throw_time)
    {
        var dir = point_direction(x, y, Player.x, Player.y);
        var i = instance_create_depth(x + lengthdir_x(throw_distance, dir), y + lengthdir_y(throw_distance, dir), 0, Object);
        i.type = "weapon";
        i.throw = true;
        i.throw_dir = dir;
        throw_timer = current_time;
    }
}
