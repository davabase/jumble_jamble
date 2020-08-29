if (mouse_check_button(mb_left))
{
    if (can_move)
    {
        with(Player)
        {
            var dist = point_distance(phy_position_x, phy_position_y, mouse_x, mouse_y);
            if (dist < global.sphere_of_influence)
            {
                // Use linear drop off.
                var force = phy_mass * 35 * (global.sphere_of_influence - dist) / global.sphere_of_influence;
                var dir = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
                var x_com = lengthdir_x(force, dir);
                var y_com = lengthdir_y(force, dir);
                physics_apply_force(phy_com_x, phy_com_y, x_com, y_com);
                
                var torque = 0;
                var dir = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y) - 90;
                if (dir < 0)
                {
                    dir += 360;
                }
                if (dir > 180)
                {
                    torque = (dir - 180) / 180 * phy_mass * 0.25;
                }
                else
                {
                    torque = (180 - dir) / 180 * -phy_mass * 0.25;
                }
                physics_apply_torque(torque);
            }
        }
        if (can_control)
        {
            with(Object)
            {
                var dist = point_distance(phy_position_x, phy_position_y, mouse_x, mouse_y);
                if (dist < global.sphere_of_influence)
                {
                    // Use linear drop off.
                    var force = phy_mass * 35 * (global.sphere_of_influence - dist) / global.sphere_of_influence;
                    var dir = point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
                    var x_com = lengthdir_x(force, dir);
                    var y_com = lengthdir_y(force, dir);
                    physics_apply_force(phy_com_x, phy_com_y, x_com, y_com);
                }
            }
        }
    }
}

if (!instance_exists(Player))
{
    if (death_timer == 0)
    {
        death_timer = current_time;
    }
    else if (current_time - death_timer > death_time)
    {
        room_restart();
    }
}

do_screen_shake();