image_xscale = 10;
image_yscale = 10;
image_speed = 0;
new_image_speed = 0.25;
max_angle = 35;
angle_increment = pi / 90;
theta = 0;

top_text = "GOD HAS FORSAKEN YOU";
bottom_text = "IN THIS UNHOLY PLACE";

if (room == rm_intermission)
{
    top_text = "YOU DEFY MY WILL";
    bottom_text = "WITH YOUR OWN?";
    max_angle = 45;
    angle_increment = pi / 90;
    sprite_index = sp_skull_mad;
    new_image_speed = 0.35;
}

text_reveal = 0;
text_reveal_time = 150; // 150 milliseconds.
text_reveal_start = 3000; // 2 seconds.
text_reveal_timer = current_time;

end_timer = 0;
end_time = 3000; // 3 seconds.
triggered_camera = false;