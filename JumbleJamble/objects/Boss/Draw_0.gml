var xx, yy, width, height;

draw_set_font(fn_large);
width = string_width(text);
height = string_height(text);
yy = y - height / 2;
xx = x - width / 2;

if (text_reveal > 0)
{
    for (var i = 1; i <= min(string_length(text), text_reveal); i++)
    {
        var char = string_char_at(text, i);
        width = string_width(char);
        var scale = choose(0.95, 1);
        var angle = random(6) - 3;
        draw_text_transformed(xx, yy, char, scale, scale, angle);
        xx += width;
    }
}

// Since image_angle is locked to phy_rotation on physics objects, we have to use a different variable.
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, draw_angle, c_white, image_alpha);
