image_angle = sin(theta) * max_angle;
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

if (text_reveal >= string_length(top_text) + string_length(bottom_text))
{
    if (end_timer == 0)
    {
        end_timer = current_time;
    }
    if (current_time - end_timer > end_time && !triggered_camera)
    {
        Camera.state = "pan";
        triggered_camera = true;
    }
}