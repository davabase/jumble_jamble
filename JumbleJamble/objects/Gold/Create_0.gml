// Physics
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, sprite_width / 2, sprite_height / 2);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.3);
physics_fixture_set_kinematic(fix);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

max_travel_dist = 6;
angle_increment = pi / 90;
theta = 0;

text = "";

if (room == rm_room_2)
{
    text = "gold boosts morale";
}