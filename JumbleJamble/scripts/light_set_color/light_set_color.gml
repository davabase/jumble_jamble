/// @description light_set_color(light, color)
/// @param light The light to affect.
/// @param color The color of the light.
/*
Sets the color of a light.
*/

var light, color;

light = argument0;
color = argument1;

ds_list_set(light, 2, color);
