var xx, yy, width, height;

draw_set_font(fn_large);
width = string_width(top_text);
height = string_height(top_text);
yy = y - sprite_height / 2 - (height + height * 0.5);
xx = x - width / 2;

if (text_reveal > 0)
{
    for (var i = 1; i <= min(string_length(top_text), text_reveal); i++)
    {
        var char = string_char_at(top_text, i);
        width = string_width(char);
        var scale = choose(0.95, 1);
        var angle = random(6) - 3;
        draw_text_transformed(xx, yy, char, scale, scale, angle);
        xx += width;
    }
}

draw_self();

width = string_width(bottom_text);
height = string_height(bottom_text);
yy = y + sprite_height / 2 + (height * 0.5);
xx = x - width / 2;
if (text_reveal > string_length(top_text))
{
    for (var i = 1; i <= min(string_length(bottom_text), text_reveal - string_length(top_text)); i++)
    {
        var char = string_char_at(bottom_text, i);
        width = string_width(char);
        var scale = choose(0.95, 1);
        var angle = random(6) - 3;
        draw_text_transformed(xx, yy, char, scale, scale, angle);
        xx += width;
    }
}