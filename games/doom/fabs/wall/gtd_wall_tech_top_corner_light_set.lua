PREFABS.Wall_tech_windows_top_corner_light =
{
  file   = "wall/gtd_wall_tech_top_corner_light_set.wad",
  map    = "MAP01",

  prob   = 50,
  theme  = "!hell",
  env = "building",

  group = "gtd_wall_tech_top_corner_light_set",

  where  = "edge",
  deep   = 32,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit  = "bottom"
}

PREFABS.Wall_tech_windows_top_corner_light_diag =
{
  template = "Wall_tech_windows_top_corner_light",
  map    = "MAP02",

  where  = "diagonal"
}

PREFABS.Wall_tech_windows_top_corner_light_hell =
{
  template = "Wall_tech_windows_top_corner_light",

  theme = "hell",

  tex_TEKLITE2 = "SKINEDGE",
  flat_CEIL3_4 = "BLOOD1"
}

PREFABS.Wall_tech_windows_top_corner_light_diag_hell =
{
  template = "Wall_tech_windows_top_corner_light",
  map = "MAP02",

  theme = "hell",

  where  = "diagonal",

  tex_TEKLITE2 = "SKINEDGE",
  flat_CEIL3_4 = "BLOOD1"
}

--

PREFABS.Wall_tech_windows_top_corner_light_thin =
{
  template = "Wall_tech_windows_top_corner_light",
  map    = "MAP03",

  deep = 16
}

PREFABS.Wall_tech_windows_top_corner_light_thin_hel =
{
  template = "Wall_tech_windows_top_corner_light",
  map    = "MAP03",

  theme = "hell",

  deep = 16,

  tex_TEKLITE2 = "SKINEDGE",
  flat_CEIL3_4 = "BLOOD1"
}
