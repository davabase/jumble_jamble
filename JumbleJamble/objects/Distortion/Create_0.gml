// Primitives can only go up to 144 vertices it seems, vertex buffers can have unlimited.
resolution = 24;

// Use -0.15 for manipulating uv coordinates and 25 for manipulating vertex coordinates.
max_warp = -0.15; //25
max_warp_dec = max_warp / 1500000; // 1.5 second;

angle_increment = pi / 30;
theta = 0;

life_timer = current_time;
life_time = 1500; // 1.5 seconds.

x_point = 0;
y_point = 0;

width = surface_get_width(application_surface);
height = surface_get_height(application_surface);
surface = surface_create(width, height);

surface_copy(surface, 0, 0, application_surface);

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_texcoord();
v_format = vertex_format_end();

if (instance_exists(Player))
{
    Player.phy_speed_x = 0;
    Player.phy_speed_y = 0;
    Player.phy_angular_velocity = 0;
}