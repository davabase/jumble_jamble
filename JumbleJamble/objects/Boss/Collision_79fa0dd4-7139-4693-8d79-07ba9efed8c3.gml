if (other.type == "weapon")
{
    hit_points -= 1;
    instance_destroy(other);
}

if (hit_points <= 0)
{
    if (!instance_exists(Distortion))
    {
        var i = instance_create_depth(0, 0, -10, Distortion);
        i.x_point = x;
        i.y_point = y;
        i.max_warp_dec = 0;
        i.max_warp = -0.1;
        i.life_time = 10000;

        instance_create_depth(0, 0, -20, WhiteOut);
    }
}