 if (other.on_fire)
{
    if (!on_fire)
    {
        on_fire = true;
        on_fire_timer = current_time;
        on_fire_hit_time = 1000; // 1 second
    }
}
