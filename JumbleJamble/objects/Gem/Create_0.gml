set_sprite("gem");
image_xscale = 2.5;
image_yscale = 2.5;

// Physics
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, sprite_width / 2, sprite_height / 2);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.3);
physics_fixture_set_kinematic(fix);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

max_travel_dist = sprite_height;
angle_increment = pi / 90;
theta = 0;

light = noone;
if (global.lighting != -1)
{
    light = light_create(global.lighting, sp_light, 3, c_white, 1, 0, false);
}
