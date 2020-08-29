/// start_screen_shake(shake_amount, shake_time)
/// shake_amount: view position multiplier
/// shake_time: how long to shake for in microseconds
global.shake_amount = argument0;
global.shake_dec = argument1 / global.shake_amount;
global.shaking = true;
global.shake_x = camera_get_view_x(view_camera[0]);
global.shake_y = camera_get_view_y(view_camera[0]);