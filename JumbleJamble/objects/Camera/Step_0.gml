if (state == "pan")
{
    if (state_previous != state)
    {
        speed_timer = current_time;
    }
    if (instance_exists(Player))
    {
        speed = top_speed * (current_time - speed_timer) / time_to_reach_top_speed;
        direction = point_direction(x, y, Player.x, Player.y);
        if (point_distance(x, y, Player.x, Player.y) < 4)
        {
            state = "follow";
        }
    }
}
else if (state == "follow")
{
    if (instance_exists(follow_object))
    {
        x = follow_object.x;
        y = follow_object.y;
    }
}

state_previous = state;

// Apparently using a physics world disables motion updates even for non-physics objects.
// That is so fucking stupid.
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);