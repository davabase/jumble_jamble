alpha = max(min(alpha, 1), 0);

draw_set_color(c_white);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

alpha -= alpha_dec * delta_time;
