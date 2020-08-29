state = "static";
state_previous = state;
top_speed = 5;
time_to_reach_top_speed = 12000 // 12 seconds.
follow_object = Player;

if (room != rm_intro && room != rm_intermission)
{
    state = "follow";
}