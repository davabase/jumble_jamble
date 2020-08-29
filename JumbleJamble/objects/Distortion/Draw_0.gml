var warp_amount = sin(theta) * max_warp;
theta += angle_increment;
if (theta > 2 * pi)
{
    theta = 0;
}

// Lessen the effect over time.
max_warp -= max_warp_dec * delta_time;

// Kill the effect if the warp amount is 0 and we are passed the time.
if (current_time - life_timer > life_time)
{
    if (warp_amount == 0)
    {
        instance_destroy();
    }
}

x = camera_get_view_x(camera_get_active());
y = camera_get_view_y(camera_get_active());
width = camera_get_view_width(camera_get_active());
height = camera_get_view_height(camera_get_active());
var gap_x = width / resolution;
var gap_y = height / resolution;

var dist1, dist2, dist3, dist4, max_dist;
dist1 = point_distance(x, y, x_point, y_point);
dist2 = point_distance(x + width, y, x_point, y_point);
dist3 = point_distance(x, y + height, x_point, y_point);
dist4 = point_distance(x + width, y + height, x_point, y_point);
max_dist = max(dist1, dist2, dist3, dist4);

var v_buff = vertex_create_buffer();
vertex_begin(v_buff, v_format);

for (var i = 0; i < resolution; i++)
{
    for (var j = 0; j < resolution; j++)
    {
        var xx1, yy1, xx2, yy2, xx3, yy3, xx4, yy4, tx1, ty1, tx2, ty2, tx3, ty3, tx4, ty4, dir, dist;
        xx1 = x + i * gap_x;
        yy1 = y + j * gap_y;
        tx1 = (i * gap_x) / width;
        ty1 = (j * gap_y) / height;
        dir = point_direction(xx1, yy1, x_point, y_point);
        dist = point_distance(xx1, yy1, x_point, y_point);
        tx1 += lengthdir_x((max_dist - dist) / max_dist * warp_amount, dir);
        ty1 += lengthdir_y((max_dist - dist) / max_dist * warp_amount, dir);

        xx2 = x + i * gap_x;
        yy2 = y + (j + 1) * gap_y;
        tx2 = (i * gap_x) / width;
        ty2 = ((j + 1) * gap_y) / height;
        dir = point_direction(xx2, yy2, x_point, y_point);
        dist = point_distance(xx2, yy2, x_point, y_point);
        tx2 += lengthdir_x((max_dist - dist) / max_dist * warp_amount, dir);
        ty2 += lengthdir_y((max_dist - dist) / max_dist * warp_amount, dir);

        xx3 = x + (i + 1) * gap_x;
        yy3 = y + j * gap_y;
        tx3 = ((i + 1) * gap_x) / width;
        ty3 = (j * gap_y) / height;
        dir = point_direction(xx3, yy3, x_point, y_point);
        dist = point_distance(xx3, yy3, x_point, y_point);
        tx3 += lengthdir_x((max_dist - dist) / max_dist * warp_amount, dir);
        ty3 += lengthdir_y((max_dist - dist) / max_dist * warp_amount, dir);
        
        xx4 = x + (i + 1) * gap_x;
        yy4 = y + (j + 1) * gap_y;
        tx4 = ((i + 1) * gap_x) / width;
        ty4 = ((j + 1) * gap_y) / height;
        dir = point_direction(xx4, yy4, x_point, y_point);
        dist = point_distance(xx4, yy4, x_point, y_point);
        tx4 += lengthdir_x((max_dist - dist) / max_dist * warp_amount, dir);
        ty4 += lengthdir_y((max_dist - dist) / max_dist * warp_amount, dir);

        vertex_position(v_buff, xx1, yy1);
        vertex_texcoord(v_buff, tx1, ty1);
        vertex_position(v_buff, xx2, yy2);
        vertex_texcoord(v_buff, tx2, ty2);
        vertex_position(v_buff, xx3, yy3);
        vertex_texcoord(v_buff, tx3, ty3);

        vertex_position(v_buff, xx2, yy2);
        vertex_texcoord(v_buff, tx2, ty2);
        vertex_position(v_buff, xx3, yy3);
        vertex_texcoord(v_buff, tx3, ty3);
        vertex_position(v_buff, xx4, yy4);
        vertex_texcoord(v_buff, tx4, ty4);
    }
}
vertex_end(v_buff);

shader_set(shd_passthrough);
vertex_submit(v_buff, pr_trianglelist, surface_get_texture(surface));
shader_reset();
