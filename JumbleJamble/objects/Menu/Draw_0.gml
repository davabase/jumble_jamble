text = "JUMBLE JAMBLE";
draw_set_font(fn_large);

var xx, yy;
xx = room_width / 2 - string_width(text) / 2;
yy = -string_height(text) / 2.2;

for (var i = 0; i < 5; i++)
{
    draw_text(xx, yy, text);
    yy += string_height(text);
}
yy += string_height(text) / 2;

text = "start";
xx = room_width / 2 - string_width(text) / 2;
draw_set_color(c_white);
if (start_selected)
{
    draw_set_color(c_red);
}
draw_text(xx, yy, text);
draw_set_color(c_white);
start_y1 = yy;
start_y2 = yy + string_height(text);

yy += string_height(text);

text = "continue";
xx = room_width / 2 - string_width(text) / 2;

if (load != noone)
{
    draw_set_color(c_white);
    if (continue_selected)
    {
        draw_set_color(c_red);
    }
    draw_text(xx, yy, text);
    draw_set_color(c_white);
    continue_y1 = yy;
    continue_y2 = yy + string_height(text);
    yy += string_height(text);
}

text = "fullscreen";
xx = room_width / 2 - string_width(text) / 2;

draw_set_color(c_white);
if (fullscreen_selected)
{
    draw_set_color(c_red);
}
draw_text(xx, yy, text);
draw_set_color(c_white);
fullscreen_y1 = yy;
fullscreen_y2 = yy + string_height(text);
yy += string_height(text);