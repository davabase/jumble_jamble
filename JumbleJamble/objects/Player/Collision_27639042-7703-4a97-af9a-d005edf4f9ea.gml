if (room = rm_room_3)
{
    phy_speed_x = 0;
    phy_speed_y = 0;
    phy_angular_velocity = 0;

    if (Control.can_move)
    {
        var i = instance_create_depth(0, 0, -10, Distortion);
        i.x_point = Gem.x;
        i.y_point = Gem.y;
        i.max_warp_dec = 0;
        i.max_warp = -0.1;
        i.life_time = 10000;
        
        instance_create_depth(0, 0, -20, WhiteOut);
        start_screen_shake(10, 5000000);
    }
    Control.can_move = false;
}