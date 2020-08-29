if (global.shaking)
{
    var xx, yy;
    xx = global.shake_x + random(global.shake_amount * 2) - global.shake_amount;
    yy = global.shake_y + random(global.shake_amount * 2) - global.shake_amount;
    camera_set_view_pos(view_camera[0], xx, yy);

    global.shake_amount -= global.shake_dec * delta_time;
    
    if (global.shake_amount <= 0)
    {
        global.shaking = false;
    }
}