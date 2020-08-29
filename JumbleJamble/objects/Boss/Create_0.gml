image_xscale = 6;
image_yscale = 6;
image_speed = 0;
new_image_speed = 0.25;
max_angle = 35;
angle_increment = pi / 90;
theta = 0;
draw_angle = 0;

text = "GOODBYE THIEF";

text_reveal = 0;
text_reveal_time = 150; // 150 milliseconds.
text_reveal_start = 2000; // 2 seconds.
text_reveal_timer = current_time;

end_timer = 0;
end_time = 3000; // 3 seconds.

x = room_width / 2;
y = room_height / 2;

image_alpha = 0;
alpha_inc = 0.01;
alpha_timer = 0;
alpha_time = 2000; // 2 seconds.

throw_timer = 0;
throw_time = 1000; // 1 second.
can_throw = false;
throw_distance = sqrt(sprite_width / 2 * sprite_width / 2 + sprite_height / 2 * sprite_height / 2) + 10;

hit_points = 10;

// Physics
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, sprite_width / 2, sprite_height / 2);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.3);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);
