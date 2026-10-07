PREFABS.Wall_tech_grated_machines_plain =
{
  file = "wall/gtd_wall_tech_grated_machines.wad",
  map = "MAP01",

  prob = 50,

  group = "gtd_wall_grated_machines",

  where = "edge",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = "top",
}

PREFABS.Wall_tech_grated_machines_diagonal =
{
  template = "Wall_tech_grated_machines_plain",
  map = "MAP02",

  prob = 50,

  group = "gtd_wall_grated_machines",

  where = "diagonal",
}

--

PREFABS.Wall_tech_grated_machines_damaged_wall =
{
  file = "wall/gtd_wall_tech_grated_machines.wad",
  map = "MAP03",

  prob = 50,

  group = "gtd_wall_grated_machines_damaged_wall",

  where = "edge",
  deep = 16,
  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = "top",

  tex_TEKWALL1 =
  {
    TEKWALL1 = 50,
    TEKWALL4 = 10,
    TEKWALL6 = 15
  }
}

PREFABS.Wall_tech_grated_machines_damaged_wall_2 =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP04",

  group = "gtd_wall_grated_machines_damaged_wall"
}

PREFABS.Wall_tech_grated_machines_damaged_wall_3 =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP05",

  group = "gtd_wall_grated_machines_damaged_wall"
}

PREFABS.Wall_tech_grated_machines_damaged_wall_mid_fit =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP03",

  group = "gtd_wall_grated_machines_damaged_wall",

  prob = 10,
  z_fit = "frame"
}

PREFABS.Wall_tech_grated_machines_damaged_wall_2_mid_fit =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP04",

  group = "gtd_wall_grated_machines_damaged_wall",

  prob = 10,
  z_fit = "frame"
}

PREFABS.Wall_tech_grated_machines_damaged_wall_3_mid_fit =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP05",

  group = "gtd_wall_grated_machines_damaged_wall",

  prob = 10,
  z_fit = "frame"
}

PREFABS.Wall_tech_grated_machines_damaged_diag_1 =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP06",

  where = "diagonal",

  group = "gtd_wall_grated_machines_damaged_wall"
}

PREFABS.Wall_tech_grated_machines_damaged_diag_2 =
{
  template = "Wall_tech_grated_machines_damaged_wall",
  map = "MAP07",

  where = "diagonal",

  group = "gtd_wall_grated_machines_damaged_wall"
}
