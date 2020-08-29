var dist = sin(theta) * max_travel_dist;
theta += angle_increment;
if (theta > 2 * pi)
{
    theta = 0;
}

phy_position_y = ystart + dist;

if (light != noone)
{
    light_set_position(light, x, y);
}