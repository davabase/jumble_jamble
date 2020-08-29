if (room = rm_room_2)
{
    instance_destroy(Gold.wall);

    phy_speed_x = 0;
    phy_speed_y = 0;

    // Movement is restored once Distortion is destroyed.
    Control.can_move = false;
    show_text = true;
    Gold.text = "";
}
else
{
    instance_destroy(other);
    Control.gold_collected += 1;
}