var x_com, y_com, dir;
dir = point_direction(x, y, Gem.x, Gem.y);
x_com = lengthdir_x(phy_mass * 100 + random(10), dir);
y_com = lengthdir_y(phy_mass * 100 + random(10), dir);
physics_apply_local_force(0, 0, x_com, y_com);
