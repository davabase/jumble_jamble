/// @description light_delete(light)
/// @param light The ds_list representing the light. Returned from light_create.
/*
Delete a light. This destroys all memory associated with a light.
*/

var light;

light = argument0;

ds_list_destroy(light);
