index = irandom(1056);
type = "none";
image_speed = 0;
sprite_index = sp_sprite_sheet_part_1;
image_index = 0;

// Properties
on_fire = false;
on_fire_timer = 0;
on_fire_hit_time = 0;
hit_points = 5;
text = "";
shake_text = false;
static = false;

fire_1 = false;
fire_2 = false;
fire_3 = false;

// Wait one step so the creating instance has time to set properties.
alarm[0] = 1;

// Temporary variables to be updated by the creator.
temp_phy_speed_x = 0;
temp_phy_speed_y = 0;

light = noone;

throw_timer = 0;
throw_time = 2000; // 2 seconds.
throw = false;
throw_dir = 0;
