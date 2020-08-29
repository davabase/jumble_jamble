if (text != "")
{
    draw_set_font(fn_small);
    var xx, yy;
    xx = x - string_width(text) / 2;
    yy = y - sprite_height - (string_height(text) + string_height(text) * 0);
    if (shake_text)
    {
         for (var i = 1; i <= string_length(text); i++)
        {
            var char = string_char_at(text, i);
            var width = string_width(char);
            var scale = choose(0.95, 1);
            var angle = random(6) - 3;
            draw_text_transformed(xx, yy, char, scale, scale, angle);
            xx += width;
        }
    }
    else
    {
        draw_text(xx, yy, text);
    }
}

draw_self();

if (fire_1)
{
    var scale = choose(0.75, 1);
    draw_sprite_ext(sp_fire, 0, x + fire_1_x, y + fire_1_y, scale * choose(1, -1), scale, 0, c_white, 1);
}
if (fire_2)
{
    var scale = choose(0.75, 1);
    draw_sprite_ext(sp_fire, 0, x + fire_2_x, y + fire_2_y, scale * choose(1, -1), scale, 0, c_white, 1);
}
if (fire_3)
{
    var scale = choose(0.75, 1);
    draw_sprite_ext(sp_fire, 0, x + fire_3_x, y + fire_3_y, scale * choose(1, -1), scale, 0, c_white, 1);
}

if (type == "person")
{
    draw_set_alpha(0.25);
    draw_set_color(c_red);
    draw_circle(x, y, 175, true);
    draw_set_color(c_white);
    draw_set_alpha(1);
}