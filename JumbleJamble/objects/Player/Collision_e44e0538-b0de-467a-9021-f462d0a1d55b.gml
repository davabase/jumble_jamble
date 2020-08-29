// Collision

if (room == rm_room_3)
{
    if (other.id == Gem.wall)
    {
        if (!show_text)
        {
            text = "god has forsaken me";
            show_text = true;
            Control.can_move = false;
            phy_speed_x = 0;
            phy_angular_velocity = 0;
        }
    }
}