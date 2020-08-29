// Collision

// Systemic stuff.
// Alright, here we fucking go.

switch (type)
{
    case "wood":
    case "bow":
    case "tree":
    case "car":
    case "shield":
    case "person":
    {
        if (other.on_fire)
        {
            if (!on_fire)
            {
                on_fire = true;
                on_fire_timer = current_time;
                on_fire_hit_time = 1000; // 1 second
            }
        }
        break;
    }
    case "bottle":
    {
        if (other.on_fire)
        {
            other.on_fire = false;
            instance_destroy();
        }
        break;
    }
}

if (type == "person")
{
    if (other.type == "weapon")
    {
        instance_destroy();
    }
}