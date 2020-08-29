// Do this in alarm[0] so that we can set instance properties after the create event.

if (type == "none")
{
    if (index > 0 && index < array_length_1d(global.tiles))
    {
        type = global.tiles[index];
    }
}
else
{
    var list = ds_map_find_value(global.map, type);
    if (list)
    {
        var i = irandom(ds_list_size(list) - 1);
        index = ds_list_find_value(list, i);
    }
    else
    {
        show_debug_message(type);
    }
}

if (index > sprite_get_number(sp_sprite_sheet_part_1) - 1)
{
    sprite_index = sp_sprite_sheet_part_2;
    image_index = index - sprite_get_number(sp_sprite_sheet_part_1);
}
else
{
    sprite_index = sp_sprite_sheet_part_1;
    image_index = index;
}

var is_square = false;
if (type == "wood" ||
    type == "lock" ||
    type == "sheild" ||
    type == "tree" ||
    type == "key" ||
    type == "car" ||
    type == "brick" ||
    type == "goal" ||
    type == "rocket")
{
    is_square = true;
}

// Physics
var fix = physics_fixture_create();
if (is_square)
{
    physics_fixture_set_box_shape(fix, 8, 8);
}
else
{
    physics_fixture_set_circle_shape(fix, 8);
}

var density = 1;
if (static)
{
    density = -1;
}
physics_fixture_set_density(fix, density);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.3);
physics_fixture_set_linear_damping(fix, 0.5);
physics_fixture_set_angular_damping(fix, 0.2);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

phy_rotation = -image_angle;
if (temp_phy_speed_x != 0 && temp_phy_speed_y != 0)
{
    phy_speed_x = temp_phy_speed_x;
    phy_speed_y = temp_phy_speed_y;
}

if (throw)
{
    var x_com = lengthdir_x(phy_mass * 15, throw_dir);
    var y_com = lengthdir_y(phy_mass * 15, throw_dir);
    physics_apply_impulse(phy_position_x, phy_position_y, x_com, y_com);
}

if (type == 0)
{
    instance_destroy();
}


if (global.lighting != -1)
{
    light = light_create(global.lighting, sp_light, 3, make_color_rgb(200, 90, 60), 1, 0, false);
    light_set_enable(light, false);
}

// Properties
if (type == "torch" || type == "fire")
{
    on_fire = true;
    if (global.lighting != -1)
    {
        light_set_enable(light, true);
    }
}

alarm[1] = 10;