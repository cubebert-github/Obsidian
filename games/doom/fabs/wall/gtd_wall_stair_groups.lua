PREFABS.Wall_stair_floor =
{
  file = "wall/gtd_wall_stair_groups.wad",
  map = "MAP01",

  kind = "wall",

  prob = 50,
  rank = 2,

  theme = "!tech",
  group = "wall_stair_1",

  where = "edge",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = "top"
}

PREFABS.Wall_stair_floor_tech =
{
  template = "Wall_stair_floor",

  rank = 1,

  theme = "tech",

  group = "wall_stair_1",

  tex_SUPPORT3 = "DOORSTOP"
}

-- stair2, uses ceiling as texture source

PREFABS.Wall_stair_ceil =
{
  file = "wall/gtd_wall_stair_groups.wad",
  map = "MAP02",

  kind = "wall",

  prob = 50,
  rank = 2,

  env = "building",
  group = "wall_stair_2",

  where = "edge",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96
}

PREFABS.Wall_stair_ceil_tech =
{
  template = "Wall_stair_ceil",

  rank = 1,

  theme = "tech",

  env = "building",

  tex_SUPPORT3 = "DOORSTOP"
}

-- stair2, compat version that uses floor

PREFABS.Wall_stair_ceil_compat =
{
  template = "Wall_stair_ceil",
  map = "MAP01",

  env = "!building",
}

PREFABS.Wall_stair_ceil_tech_compat =
{
  template = "Wall_stair_ceil",
  map = "MAP01",

  rank = 1,
  env = "!building",

  theme = "tech",

  tex_SUPPORT3 = "DOORSTOP"
}
