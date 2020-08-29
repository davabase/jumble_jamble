if (Camera.state == "follow")
{
    draw_set_color(c_white);
    if (mouse_check_button(mb_left))
    {
        draw_circle(mouse_x, mouse_y, global.sphere_of_influence, true);
    }
    else
    {
        draw_set_alpha(0.2);
        draw_circle(mouse_x, mouse_y, global.sphere_of_influence, true);
        draw_set_alpha(1);
    }
}

// physics_world_draw_debug(phy_debug_render_shapes);

if (global.lighting != -1)
{
    light_draw(global.lighting, 0, 0, true, false, 0);
}