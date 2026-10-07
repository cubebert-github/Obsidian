PREFABS.Wall_gtd_ribbed_lights =
{
  file = "wall/gtd_wall_industrial_ribbed_light_set.wad",
  map = "MAP01",

  port = "zdoom",

  prob = 50,
  group = "gtd_ribbed_lights",

  where = "edge",

  deep = 16,

  height = 128,

  bound_z1 = 0,
  bound_z2 = 128,

  z_fit = "top",

  sector_1 = { [0]=90, [1]=15 }
}

PREFABS.Wall_gtd_ribbed_lights_diag =
{
  template = "Wall_gtd_ribbed_lights",

  map = "MAP02",

  where = "diagonal"
}

PREFABS.Wall_gtd_ribbed_lights_fallback =
{
  template = "Wall_gtd_ribbed_lights",

  map = "MAP03",

  port = "!zdoom"
}

PREFABS.Wall_gtd_ribbed_lights_diag_fallback =
{
  template = "Wall_gtd_ribbed_lights",

  map = "MAP04",

  port = "!zdoom",

  where = "diagonal"
}

--

PREFABS.Wall_gtd_ribbed_lights_no3d =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP03",

  group = "gtd_ribbed_lights_no3d"
}

PREFABS.Wall_gtd_ribbed_lights_no3d_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP04",

  where = "diagonal",

  group = "gtd_ribbed_lights_no3d"
}

--

PREFABS.Wall_gtd_ribbed_lights_slump =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP05",

  group = "gtd_ribbed_lights_slump"
}

PREFABS.Wall_gtd_ribbed_lights_slump_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP06",

  where = "diagonal",

  group = "gtd_ribbed_lights_slump"
}

--

PREFABS.Wall_gtd_ribbed_lights_slump_two_color =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP07",

  group = "gtd_ribbed_lights_slump_two_color"
}

PREFABS.Wall_gtd_ribbed_lights_slump_two_color_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP08",

  where = "diagonal",

  group = "gtd_ribbed_lights_slump_two_color"
}

--

PREFABS.Wall_gtd_ribbed_lights_tekmachine =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP09",

  group = "gtd_ribbed_lights_tekmachine",

  tex_SHAWN2 = "METAL",
  tex_TEKLITE2 = "TEKWALL4"
}

PREFABS.Wall_gtd_ribbed_lights_tekmachine_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP10",

  where = "diagonal",

  group = "gtd_ribbed_lights_tekmachine",

  tex_SHAWN2 = "METAL",
  tex_TEKLITE2 = "TEKWALL4"
}


PREFABS.Wall_gtd_ribbed_lights_tekmachine_alt =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP09",

  group = "gtd_ribbed_lights_tekmachine_alt",

  flat_FLAT17 = "TLITE6_4",
  tex_LITEBLU1 = "LITE3"
}

PREFABS.Wall_gtd_ribbed_lights_tekmachine_alt_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP10",

  where = "diagonal",

  group = "gtd_ribbed_lights_tekmachine_alt",

  flat_FLAT17 = "TLITE6_4",
  tex_LITEBLU1 = "LITE3"
}

--

PREFABS.Wall_gtd_ribbed_lights_very_blue =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP11",

  group = "gtd_ribbed_lights_very_blue",

  height = 96,
  bound_z2 = 96
}

PREFABS.Wall_gtd_ribbed_lights_very_blue_row =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP12",

  prob = 10,
  group = "gtd_ribbed_lights_very_blue",

  height = 96,
  bound_z2 = 96
}

PREFABS.Wall_gtd_ribbed_lights_blue_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP13",

  where = "diagonal",
  group = "gtd_ribbed_lights_very_blue",

  height = 96,
  bound_z2 = 96
}

--

PREFABS.Wall_gtd_ribbed_lights_ribbed_steps =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP14",

  group = "gtd_ribbed_lights_ribbed_steps",

  height = 96,
  bound_z2 = 96,

  z_fit = { 79,81 }
}

PREFABS.Wall_gtd_ribbed_lights_ribbed_steps_break =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP15",

  prob = 7,
  group = "gtd_ribbed_lights_ribbed_steps",

  height = 96,
  bound_z2 = 96,

  z_fit = { 79,81 }
}

PREFABS.Wall_gtd_ribbed_lights_ribbed_steps_diag =
{
  template = "Wall_gtd_ribbed_lights",
  map = "MAP16",

  where = "diagonal",
  group = "gtd_ribbed_lights_ribbed_steps",

  height = 96,
  bound_z2 = 96,

  z_fit = { 79,81 }
}

--

PREFABS.Wall_gtd_ribbed_lights_rdwall_short =
{
  file = "wall/gtd_wall_industrial_ribbed_light_set.wad",
  map = "MAP17",

  port = "zdoom",

  prob = 50,
  group = "gtd_ribbed_lights_rdwall_EPIC",

  where = "edge",

  deep = 16,

  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = "top",
}

PREFABS.Wall_gtd_ribbed_lights_rdwall_long =
{
  template = "Wall_gtd_ribbed_lights_rdwall_short",
  map = "MAP18",

  prob = 5,

  height = 96,

  bound_z2 = 96,

  z_fit = { 74,76 , 82,84 },
}

PREFABS.Wall_gtd_ribbed_lights_rdwall_long_diagonal =
{
  template = "Wall_gtd_ribbed_lights_rdwall_short",
  map = "MAP19",

  where = "diagonal",
  prob = 5,

  height = 96,

  bound_z2 = 96,

  z_fit = { 74,76 , 82,84 },
}

--

PREFABS.Wall_gtd_ribbed_vox_lights =
{
  file = "wall/gtd_wall_industrial_ribbed_light_set.wad",
  map = "MAP20",

  port = "zdoom",

  prob = 50,
  group = "gtd_ribbed_lights_vox_lights_EPIC",

  where = "edge",

  deep = 16,

  height = 96,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = {87,89}
}

PREFABS.Wall_gtd_ribbed_vox_lights_pillar =
{
  template = "Wall_gtd_ribbed_vox_lights",
  map = "MAP21",

  prob = 5
}

PREFABS.Wall_gtd_ribbed_vox_lights_diagonal =
{
  template = "Wall_gtd_ribbed_vox_lights",
  map = "MAP22",

  where = "diagonal"
}
