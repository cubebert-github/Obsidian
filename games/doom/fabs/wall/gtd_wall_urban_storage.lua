PREFABS.Wall_urban_storage1 =
{
  file   = "wall/gtd_wall_urban_storage.wad",
  map    = "MAP01",

  prob   = 50,
  theme  = "!hell",
  env = "building",

  group = "gtd_wall_urban_storage",

  where  = "edge",
  deep   = 16,
  height = 128,

  bound_z1 = 0,
  bound_z2 = 128,

  z_fit  = "top",
}

PREFABS.Wall_urban_storage2 =
{
  template = "Wall_urban_storage1",
  map = "MAP02",
}

PREFABS.Wall_urban_storage2_expensive_shit =
{
  template = "Wall_urban_storage1",
  map = "MAP02",

  prob = 5,

  texture_pack = "armaetus",

  tex_CRATE1 = "CRATJOKE",
}

PREFABS.Wall_urban_storage3 =
{
  template = "Wall_urban_storage1",
  map = "MAP03",
}

PREFABS.Wall_urban_storage_diag =
{
  template = "Wall_urban_storage1",
  map = "MAP05",

  where  = "diagonal",

  tex_CRATELIT = { CRATELIT=50, CRATINY=20, CRATWIDE=50 },
}

--

PREFABS.Wall_urban_storage_wood =
{
  template = "Wall_urban_storage1",
  map = "MAP08",

  prob = 50,
  rank = 2,

  group = "gtd_storage_wood",

  where = "edge",
  deep = 16,
  height = 128,

  bound_z1 = 0,
  bound_z2 = 129,

  z_fit = "top",

  tex_WODCRAT1 =
  {
    WODCRAT1 = 1,
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  },

  tex_WODCRAT2 =
  {
    WODCRAT1 = 1,
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  },

  tex_WODCRAT3 =
  {
    WODCRAT1 = 1,
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  },

  tex_WODCRAT4 =
  {
    WODCRAT1 = 1,
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  }
}

PREFABS.Wall_urban_storage_wood_short =
{
  template = "Wall_urban_storage1",
  map = "MAP07",

  prob = 50,
  rank = 1,

  group = "gtd_storage_wood",

  where = "edge",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 128,

  z_fit  = "top",

  tex_WODCRAT2 =
  {
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1
  },

  tex_WODCRAT3 =
  {
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1
  },

  tex_WODCRAT4 =
  {
    WODCRAT2 = 1,
    WODCRAT3 = 1,
    WODCRAT4 = 1
  }
}

PREFABS.Wall_urban_storage_wood_diagonal =
{
  template = "Wall_urban_storage1",
  map = "MAP09",

  prob = 50,

  group = "gtd_storage_wood",

  where = "diagonal",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 128,

  z_fit  = "top",

  tex_WODCRAT1 =
  {
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  },

  tex_WODCRAT2 =
  {
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  },

  tex_WODCRAT3 =
  {
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  },

  tex_WODCRAT4 =
  {
    WODCRAT3 = 1,
    WODCRAT4 = 1,
    WODCRAT5 = 1,
    WOOD13 = 1,
    WOOD14 = 1
  }
}
