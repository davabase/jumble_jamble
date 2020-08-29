// Physics
var fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, 8);
physics_fixture_set_density(fix, 1);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.3);
physics_fixture_set_linear_damping(fix, 0.5);
physics_fixture_set_angular_damping(fix, 0.2);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

phy_rotation = -image_angle;

show_text = false;
show_timer = 0;
show_time = 1000; // 3 seconds.
text_timer = 0;
text_time = 3000; // 5 seconds.

text = "";
shake_text = false;
text_reveal = 0;
text_reveal_time = 250; // 250 milliseconds.
text_reveal_timer = current_time;

on_fire = false;
on_fire_timer = 0;
on_fire_hit_time = 0;
hit_points = 5;

fire_1 = false;
fire_2 = false;
fire_3 = false;

if (room == rm_intro)
{
    text = "click to impart your will on yourself";
}
else if (room == rm_room_2)
{
    text = "gold. i remember gold.";
}
else if (room == rm_ending)
{
    text = "finally i am at peace";
}

light = noone;
if (global.lighting != -1)
{
    light = light_create(global.lighting, sp_light, 1, c_white, 0.5, 0, false);
}

if (room == rm_room_3)
{
    depth = -200;
}
