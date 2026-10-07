PREFABS.Wall_tech_vertical_light =
{
  file   = "wall/gtd_wall_tech_vertical_light_set.wad",
  map    = "MAP01",

  prob   = 50,

  group = "gtd_wall_vertical_light_1",

  where  = "edge",
  deep   = 16,
  height = 128,

  bound_z1 = 0,
  bound_z2 = 128,

  z_fit  = "top",
}

PREFABS.Wall_tech_vertical_light_diag =
{
  file   = "wall/gtd_wall_tech_vertical_light_set.wad",
  map    = "MAP02",

  prob   = 50,
  group = "gtd_wall_vertical_light_1",

  where  = "diagonal",

  height = 128,

  bound_z1 = 0,
  bound_z2 = 128,

  z_fit  = "top",
}

PREFABS.Wall_tech_vertical_light_2 =
{
  template = "Wall_tech_vertical_light",

  group = "gtd_wall_vertical_light_2",

  tex_LITE2 = "LITE96",
}

PREFABS.Wall_tech_vertical_light_2_diag =
{
  template = "Wall_tech_vertical_light_diag",

  group = "gtd_wall_vertical_light_2",

  tex_LITE2 = "LITE96",
}

PREFABS.Wall_tech_vertical_light_3 =
{
  template = "Wall_tech_vertical_light",

  group = "gtd_wall_vertical_light_3",

  tex_LITE2 = "LITESTON",
}

PREFABS.Wall_tech_vertical_light_3_diag =
{
  template = "Wall_tech_vertical_light_diag",

  group = "gtd_wall_vertical_light_3",

  tex_LITE2 = "LITESTON",
}

--

PREFABS.Wall_tech_redlite =
{
  file = "wall/gtd_wall_tech_vertical_light_set.wad",
  map = "MAP05",

  prob = 50,

  group = "gtd_wall_redlite",

  where = "edge",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit  = "top"
}

PREFABS.Wall_tech_redlite_diag =
{
  template = "Wall_tech_redlite",
  map = "MAP06",

  where = "diagonal"
}

PREFABS.Wall_tech_brownlite =
{
  template = "Wall_tech_redlite",
  map = "MAP05",

  where = "edge",
  group = "gtd_wall_brownlite",

  flat_FLOOR1_7 = "CEIL3_4",
  tex_REDWALL = "TANROCK2"
}

PREFABS.Wall_tech_brownlite_diag =
{
  template = "Wall_tech_redlite",
  map = "MAP06",

  where = "diagonal",
  group = "gtd_wall_brownlite",

  flat_FLOOR1_7 = "CEIL3_4",
  tex_REDWALL = "TANROCK2"
}

PREFABS.Wall_tech_grnlite =
{
  template = "Wall_tech_redlite",
  map = "MAP05",

  where = "edge",
  group = "gtd_wall_grnlite",

  flat_FLOOR1_7 = "GRNLITE1",
  tex_REDWALL = "ZIMMER7"
}

PREFABS.Wall_tech_grnlite_diag =
{
  template = "Wall_tech_redlite",
  map = "MAP06",

  where = "diagonal",
  group = "gtd_wall_grnlite",

  flat_FLOOR1_7 = "GRNLITE1",
  tex_REDWALL = "ZIMMER7"
}
