PREFABS.Window_thin_mid_space_1 =
{
  file   = "window/gtd_window_bunker_mid_space.wad",
  map    = "MAP01",

  group  = "gtd_window_bunker_mid_space",
  prob   = 50,

  where  = "edge",
  seed_w = 1,

  height = 96,
  deep   = 16,
  over   = 16,

  bound_z1 = 0,
  bound_z2 = 96,
}

PREFABS.Window_thin_mid_space_2 =
{
  template = "Window_thin_mid_space_1",
  map = "MAP02",

  seed_w = 2
}

PREFABS.Window_thin_mid_space_3 =
{
  template = "Window_thin_mid_space_1",
  map = "MAP03",

  seed_w = 3
}

PREFABS.Window_thin_mid_space_4 =
{
  template = "Window_thin_mid_space_1",
  map = "MAP04",

  seed_w = 4
}

--#

PREFABS.Window_bunker_terrace_1 =
{
  file   = "window/gtd_window_bunker_mid_space.wad",
  map    = "MAP10",

  group  = "gtd_window_bunker_terrace",
  prob   = 50,

  passable = true,

  where  = "edge",
  seed_w = 1,

  height = 96,
  deep   = 16,
  over   = 16,

  bound_z1 = 0,
  bound_z2 = 96,

  z_fit = {81,82 , 88,92}
}

PREFABS.Window_bunker_terrace_2 =
{
  template = "Window_bunker_terrace_1",
  map = "MAP11",

  seed_w = 2
}

PREFABS.Window_bunker_terrace_3 =
{
  template = "Window_bunker_terrace_1",
  map = "MAP12",

  seed_w = 3
}

PREFABS.Window_bunker_terrace_4 =
{
  template = "Window_bunker_terrace_1",
  map = "MAP13",

  seed_w = 4
}
