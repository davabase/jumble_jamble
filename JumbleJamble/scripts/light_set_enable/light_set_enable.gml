/// @description light_set_enable(light, enable)
/// @param light The light to affect.
/// @param enable Whether to enable or disable a light.
/*
Sets the enable flag for a light.
*/

var light, enable;

light = argument0;
enable = argument1;

ds_list_set(light, 9, enable);
