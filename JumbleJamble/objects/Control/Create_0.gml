var load = ds_map_create();
ds_map_add(load, "room", room);
ds_map_add(load, "gold", global.gold);
ds_map_secure_save(load, "save.dat");
gold_collected = 0;

randomize();

depth = -100;

// The first level is monochrome, to set the mood.
if (room == rm_intro || room == rm_room_1 || room == rm_room_2 || room == rm_room_1_1)
{
    var layer_id = layer_get_id("Tiles_Back");
    var tile_id = layer_tilemap_get_id(layer_id);
    tilemap_tileset(tile_id, ts_sheet_mono);

    layer_id = layer_get_id("Tiles_Front");
    tile_id = layer_tilemap_get_id(layer_id);
    tilemap_tileset(tile_id, ts_sheet_mono);
}


global.sphere_of_influence = 16 * 8;

death_timer = 0;
death_time = 2000; // 2 seconds.

can_move = true;
can_control = false;
if (room == rm_room_4 || room == rm_room_5 || room == rm_intermission || room == rm_room_6 || room == rm_room_7 || room == rm_bossfight)
{
    can_control = true;
}

global.shaking = false;

global.lighting = -1;
if (room == rm_room_2_1 || room == rm_room_2_3 || room == rm_room_3)
{
    color = make_color_hsv(64, 255 * 0.1, 255 * 0.175);
    global.lighting = light_init(room_width, room_height, 128, color, 1, -1, -1);
}

//Physics
global.default_gravity_force = 9.8; //9.8
global.gravity_force = global.default_gravity_force;
global.gravity_dir = 270;
physics_world_create(1 / 32);
physics_world_gravity(lengthdir_x(global.gravity_force, global.gravity_dir),
                      lengthdir_y(global.gravity_force, global.gravity_dir));
physics_world_update_iterations(20);

var fix = physics_fixture_create();
physics_fixture_set_edge_shape(fix, 0, 0, room_width, 0);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.1);
physics_fixture_set_restitution(fix, 0.2);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

fix = physics_fixture_create();
physics_fixture_set_edge_shape(fix, room_width, 0, room_width, room_height);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.1);
physics_fixture_set_restitution(fix, 0.2);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

fix = physics_fixture_create();
physics_fixture_set_edge_shape(fix, 0, 0, 0, room_height);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.1);
physics_fixture_set_restitution(fix, 0.2);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);

fix = physics_fixture_create();
physics_fixture_set_edge_shape(fix, 0, room_height, room_width, room_height);
physics_fixture_set_density(fix, -1);
physics_fixture_set_friction(fix, 0.1);
physics_fixture_set_restitution(fix, 0.2);
physics_fixture_bind(fix, id);
physics_fixture_delete(fix);


prepare_objects();

/*
var yy = 0;
for (var i = 0; i < 1056; i++)
{
    var xx, instance;
    xx = i % 48;
    if (xx == 0)
    {
        yy++;
    }

    instance = instance_create_depth(xx * 18 + 10, yy * 18 + 10, 0, Object);
    instance.index = i;
}
*/