if (light != noone)
{
    light_delete(light);
    light = noone;
}

if (type == "person")
{
    // Create a random skull at death.
    var i = instance_create_depth(x, y, 0, Object);
    i.image_angle = image_angle;
    i.temp_phy_speed_x = phy_speed_x;
    i.temp_phy_speed_y = phy_speed_y;
    i.type = "skull";
}