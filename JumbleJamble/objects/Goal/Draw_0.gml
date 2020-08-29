if (text != "")
{
    draw_set_font(fn_small);
    var xx, yy;
    xx = x - string_width(text) / 2;
    yy = y - sprite_height - (string_height(text) + string_height(text) * 0.25);
    draw_text(xx, yy, text);
}

draw_self();