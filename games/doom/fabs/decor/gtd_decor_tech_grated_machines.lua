PREFABS.Decor_wall_grated_machines_pillar =
{
  file = "decor/gtd_decor_tech_grated_machines.wad",
  map = "MAP01",

  where = "point",

  group = "gtd_wall_grated_machines_damaged_wall",

  prob = 5000,

  size = 64,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = "top"
}

PREFABS.Decor_wall_grated_machines_pillar_broken =
{
  file = "decor/gtd_decor_tech_grated_machines.wad",
  map = "MAP02",

  where = "point",

  group = "gtd_wall_grated_machines_damaged_wall",

  prob = 500,

  size = 64,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96
}

PREFABS.Decor_wall_grated_machines_pillar_large_broken =
{
  template = "Decor_wall_grated_machines_pillar_broken",
  map = "MAP03",

  prob = 3500,

  size = 96,
}

PREFABS.Decor_wall_grated_machines_pillar_broken_tall =
{
  template = "Decor_wall_grated_machines_pillar_broken",
  map = "MAP02",

  prob = 500,

  size = 96,

  z_fit = "stretch"
}

PREFABS.Decor_wall_grated_machines_pillar_large_broken_tall =
{
  template = "Decor_wall_grated_machines_pillar_broken",
  map = "MAP03",

  prob = 3500,

  size = 96,

  z_fit = "stretch"
}
