var new_type = argument0;
var list = ds_map_find_value(global.map, new_type);
var i = irandom(ds_list_size(list) - 1);
index = ds_list_find_value(list, i);

type = "none";
if (index > 0 && index < array_length_1d(global.tiles))
{
    type = global.tiles[index];
}

if (index > sprite_get_number(sp_sprite_sheet_part_1) - 1)
{
    sprite_index = sp_sprite_sheet_part_2;
    image_index = index - sprite_get_number(sp_sprite_sheet_part_1);
}
else
{
    sprite_index = sp_sprite_sheet_part_1;
    image_index = index;
}
image_speed = 0;